-- Java support for the software testing course.
--
-- Everything Java-specific lives in this file: jdtls, the java-debug adapter,
-- JUnit test running/debugging, and SpotBugs. The Mason packages it needs are
-- installed automatically the first time a Java file is opened. SpotBugs must
-- be installed separately (see README).
--
-- To remove it after the course: delete this file and run `:Lazy clean` (and
-- optionally `:MasonUninstall jdtls java-debug-adapter java-test`).

local tools = { 'jdtls', 'java-debug-adapter', 'java-test' }

local function mason_dir()
  return vim.env.MASON or (vim.fn.stdpath 'data' .. '/mason')
end

--- Jars that jdtls loads as extensions. Without these there is no debugger
--- and no test runner.
local function java_bundles()
  local share = mason_dir() .. '/share'
  local bundles = vim.fn.glob(share .. '/java-debug-adapter/com.microsoft.java.debug.plugin-*.jar', false, true)

  local excluded = {
    'com.microsoft.java.test.runner-jar-with-dependencies.jar',
    'jacocoagent.jar',
  }
  for _, jar in ipairs(vim.fn.glob(share .. '/java-test/*.jar', false, true)) do
    if not vim.tbl_contains(excluded, vim.fn.fnamemodify(jar, ':t')) then
      bundles[#bundles + 1] = jar
    end
  end

  return bundles
end

local install_state = { status = 'idle', callbacks = {} }

--- Install the Java tooling through Mason once per session. If another Java
--- buffer triggers this while the installation is running, wait for it.
local function ensure_tools(callback)
  if install_state.status == 'ready' then
    callback()
    return
  elseif install_state.status == 'failed' then
    return
  end

  install_state.callbacks[#install_state.callbacks + 1] = callback
  if install_state.status == 'installing' then
    return
  end
  install_state.status = 'installing'

  local ok, registry = pcall(require, 'mason-registry')
  if not ok then
    install_state.status = 'failed'
    vim.notify('Java support requires mason.nvim', vim.log.levels.ERROR)
    return
  end

  local missing = {}
  for _, name in ipairs(tools) do
    local package = registry.get_package(name)
    if not package:is_installed() then
      missing[#missing + 1] = package
    end
  end

  if #missing == 0 then
    install_state.status = 'ready'
    for _, cb in ipairs(install_state.callbacks) do
      cb()
    end
    install_state.callbacks = {}
    return
  end

  local names = vim.tbl_map(function(package)
    return package.name
  end, missing)
  vim.notify('Installing Java tooling: ' .. table.concat(names, ', '), vim.log.levels.INFO)

  local remaining = #missing
  local failed = false

  local function finish()
    if failed then
      install_state.status = 'failed'
      install_state.callbacks = {}
      return
    end
    install_state.status = 'ready'
    local callbacks = install_state.callbacks
    install_state.callbacks = {}
    for _, cb in ipairs(callbacks) do
      cb()
    end
  end

  for _, package in ipairs(missing) do
    package:install({}, function(success, err)
      remaining = remaining - 1
      if not success then
        failed = true
        local reason = type(err) == 'table' and (err.message or vim.inspect(err)) or tostring(err)
        vim.schedule(function()
          vim.notify(('Failed to install %s: %s'):format(package.name, reason), vim.log.levels.ERROR)
        end)
      end
      if remaining == 0 then
        vim.schedule(finish)
      end
    end)
  end
end

local root_markers = {
  'mvnw',
  'gradlew',
  'pom.xml',
  'build.gradle',
  'build.gradle.kts',
  'settings.gradle',
  'settings.gradle.kts',
  'build.xml',
  '.git',
}

local function project_root(bufnr)
  return vim.fs.root(bufnr, root_markers) or vim.fn.getcwd()
end

--- Source and class directories for the SpotBugs compiler plugin.
local function spotbugs_properties(root)
  if vim.fn.filereadable(root .. '/pom.xml') == 1 then
    return {
      sourceDirPath = { 'src/main/java' },
      classDirPath = { 'target/classes' },
      testSourceDirPath = { 'src/test/java' },
      testClassDirPath = { 'target/test-classes' },
    }
  end
  if vim.fn.filereadable(root .. '/build.gradle') == 1 or vim.fn.filereadable(root .. '/build.gradle.kts') == 1 then
    return {
      sourceDirPath = { 'src/main/java' },
      classDirPath = { 'build/classes/java/main' },
      testSourceDirPath = { 'src/test/java' },
      testClassDirPath = { 'build/classes/java/test' },
    }
  end
end

--- Run SpotBugs on the current buffer's compiled class through Neovim's
--- built-in SpotBugs compiler plugin and put the findings in the quickfix list.
local function run_spotbugs(bufnr)
  if vim.fn.executable 'spotbugs' == 0 then
    vim.notify('SpotBugs is not installed; put the `spotbugs` command on PATH', vim.log.levels.ERROR)
    return
  end

  vim.b[bufnr].spotbugs_properties = spotbugs_properties(project_root(bufnr))

  -- compiler/spotbugs.vim refuses to reload while a compiler is active, so
  -- reset it to make this work from every Java buffer.
  vim.g.current_compiler = nil
  local configured, config_err = pcall(vim.cmd, 'compiler spotbugs')
  if not configured then
    vim.notify('SpotBugs setup failed: ' .. tostring(config_err), vim.log.levels.ERROR)
    return
  end

  local made, make_err = pcall(vim.cmd, 'silent make')
  local shell_error = vim.v.shell_error
  local findings = #vim.fn.getqflist()
  if not made then
    vim.notify('SpotBugs failed: ' .. tostring(make_err), vim.log.levels.ERROR)
  elseif shell_error ~= 0 then
    vim.notify('SpotBugs failed; compile the project first', vim.log.levels.ERROR)
  elseif findings == 0 then
    vim.notify('SpotBugs found no issues', vim.log.levels.INFO)
  else
    vim.cmd 'copen'
    vim.notify(('SpotBugs: %d finding(s)'):format(findings), vim.log.levels.WARN)
  end
end

local function java_config(bufnr)
  local root = project_root(bufnr)

  local workspace = vim.fn.stdpath 'cache'
    .. '/jdtls/'
    .. vim.fn.fnamemodify(root, ':t')
    .. '-'
    .. vim.fn.sha256(root):sub(1, 8)

  return {
    cmd = { 'jdtls', '-data', workspace },
    root_dir = root,
    init_options = { bundles = java_bundles() },
    settings = {
      java = {
        signatureHelp = { enabled = true },
      },
    },
    on_attach = function(client, b)
      if client.name ~= 'jdtls' then
        return
      end

      local function map(lhs, rhs, desc)
        vim.keymap.set('n', lhs, rhs, { buffer = b, desc = desc })
      end

      map('<leader>jo', function()
        require('jdtls').organize_imports()
      end, 'Java: Organize imports')
      map('<leader>jt', function()
        require('jdtls').test_nearest_method()
      end, 'Java: Debug test under cursor')
      map('<leader>jT', function()
        require('jdtls').test_class()
      end, 'Java: Debug test class')
      map('<leader>jp', function()
        require('jdtls').pick_test()
      end, 'Java: Pick test to debug')
      map('<leader>jg', function()
        require('jdtls.tests').generate()
      end, 'Java: Generate tests')
      map('<leader>jc', function()
        require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
      end, 'Java: Conditional breakpoint')
      map('<leader>jf', function()
        require('dap').restart_frame()
      end, 'Java: Drop to frame')
      map('<leader>jw', function()
        local expression = vim.fn.input 'Watch expression: '
        if expression ~= '' then
          require('dapui').open()
          require('dapui').elements.watches.add(expression)
        end
      end, 'Java: Add watch expression')
      map('<leader>js', function()
        run_spotbugs(b)
      end, 'Java: Run SpotBugs')

      vim.api.nvim_buf_create_user_command(b, 'JavaSpotBugs', function()
        run_spotbugs(b)
      end, { desc = 'Run SpotBugs and show findings in the quickfix list' })
    end,
  }
end

local function attach(bufnr)
  if not vim.api.nvim_buf_is_valid(bufnr) or vim.bo[bufnr].filetype ~= 'java' then
    return
  end
  if vim.fn.executable 'java' == 0 then
    vim.notify('Java support needs a JDK (java) on PATH', vim.log.levels.ERROR)
    return
  end

  -- `dap = {}` registers the java debug adapter and adds the :Jdt* commands.
  require('jdtls').start_or_attach(java_config(bufnr), { dap = {} }, { bufnr = bufnr })
end

return {
  'mfussenegger/nvim-jdtls',
  ft = 'java',
  dependencies = {
    'mfussenegger/nvim-dap',
    'mason-org/mason.nvim',
  },
  config = function()
    local group = vim.api.nvim_create_augroup('java-course', { clear = true })
    vim.api.nvim_create_autocmd('FileType', {
      group = group,
      pattern = 'java',
      callback = function(args)
        ensure_tools(function()
          attach(args.buf)
        end)
      end,
    })

    -- The FileType event that loaded this plugin already fired.
    if vim.bo.filetype == 'java' then
      local bufnr = vim.api.nvim_get_current_buf()
      ensure_tools(function()
        attach(bufnr)
      end)
    end
  end,
}
