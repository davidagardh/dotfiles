vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'norg', 'neorg' },
  callback = function()
    if pcall(vim.treesitter.start) then
      vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.norg',
  callback = function()
    -- Save the current cursor position to avoid jumping
    local view = vim.fn.winsaveview()

    -- Execute the '=' operator on the whole file
    vim.cmd 'normal! gg=G'

    -- Restore the cursor position
    vim.fn.winrestview(view)
  end,
})

return {
  'nvim-neorg/neorg',
  lazy = false,
  ft = { 'norg' },
  cmd = 'Neorg',
  version = false,
  dependencies = {
    {
      -- TODO when neorg fixes compatiblity with treesitter main
      -- Change version to '*'
      -- Remove this dependency
      -- Remove autocmd
      -- make lazy
      'nvim-neorg/tree-sitter-norg',
      build = {
        'rockspec',
        function()
          local from = vim.fn.stdpath 'data' .. '/lazy-rocks/tree-sitter-norg/lib64/lua/5.1/parser/norg.so'
          local to = vim.fn.stdpath 'data' .. '/lazy/nvim-treesitter/parser/norg.so'
          vim.fn.mkdir(vim.fn.fnamemodify(to, ':p:h'), 'p')

          local ok, err, err_name = vim.uv.fs_symlink(from, to, { dir = false, junction = false })
          if not ok then
            vim.notify(
              ('copy %s to %s failed for %s %s'):format(from, to, err, err_name),
              vim.log.levels.ERROR,
              { title = 'tree-sitter-norg' }
            )
          else
            vim.notify(('copy %s to %s success'):format(from, to), vim.log.levels.INFO, { title = 'tree-sitter-norg' })
          end
        end,
      },
    },
  },
  opts = {
    load = {
      ['core.concealer'] = {},
      ['core.defaults'] = {},
      ['core.dirman'] = {
        config = {
          workspaces = { notes = '~/Documents/neo' },
          default_workspace = 'notes',
        },
      },
      ['core.export'] = {},
      ['core.export.html'] = {},
      ['core.export.markdown'] = {},
      ['core.keybinds'] = {},
      ['core.qol.todo_items'] = {},
    },
  },
  keys = {
    {
      '<leader>nn',
      '<Plug>(neorg.dirman.new-note)',
      desc = 'Open new note',
    },
    {
      '<leader>ni',
      '<cmd>Neorg index<cr>',
      desc = 'Open index',
    },
    {
      '<leader>nc',
      function()
        vim.cmd 'Neorg toggle-concealer'
        if vim.opt_local.conceallevel._value == 2 then
          vim.opt_local.conceallevel = 0
        else
          vim.opt_local.conceallevel = 2
          vim.opt_local.concealcursor = 'nv'
        end
      end,
      ft = 'norg',
      desc = 'Toggle concealer',
    },
    {
      '<leader>ne',
      function()
        if vim.opt_local.concealcursor._value == '' then
          vim.opt_local.concealcursor = 'nv'
        else
          vim.opt_local.concealcursor = ''
        end
      end,
      ft = 'norg',
      desc = 'Toggle edit mode',
    },
    {
      '<M-o>',
      'o<Plug>(neorg.itero.next-iteration)',
      ft = 'norg',
      desc = 'New line next iteration',
    },
    {
      '<M-O>',
      'O<Plug>(neorg.itero.next-iteration)',
      ft = 'norg',
      desc = 'New line next iteration',
    },
    {
      'z<',
      function()
        if vim.opt_local.foldlevel._value > 0 then
          vim.opt_local.foldlevel = vim.opt_local.foldlevel - 1
        end
      end,
      ft = 'norg',
      desc = 'Fold 1',
    },
    {
      'z>',
      function()
        vim.opt_local.foldlevel = vim.opt_local.foldlevel + 1
      end,
      ft = 'norg',
      desc = 'Unfold 1',
    },
    {
      '<BS>',
      function()
        vim.cmd 'w'
        Snacks.bufdelete()
      end,
    },
  },
}
