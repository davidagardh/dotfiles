return {
  'mhartington/formatter.nvim',
  config = function()
    local format_is_enabled = true
    vim.api.nvim_create_user_command('AutoFormatterToggle', function()
      format_is_enabled = not format_is_enabled
      print('Setting autoformatting to: ' .. tostring(format_is_enabled))
    end, {})

    -- Create an augroup that is used for managing our formatting autocmds.
    --      We need one augroup per client to make sure that multiple clients
    --      can attach to the same buffer without interfering with each other.
    local grp = vim.api.nvim_create_augroup('auto-formatters', { clear = true })

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('kickstart-lsp-attach-format', { clear = true }),
      -- This is where we attach the autoformatting for reasonable clients
      callback = function(args)
        --local client_id = args.data.client_id
        --local client = vim.lsp.get_client_by_id(client_id)
        local bufnr = args.buf

        -- Create an autocmd that will run *before* we save the buffer.
        --  Run the formatting command for the LSP that has just attached.
        vim.api.nvim_create_autocmd('BufWritePre', {
          group = grp,
          buffer = bufnr,
          callback = function()
            if not format_is_enabled then
              return
            end

            vim.cmd 'FormatWrite'
          end,
        })
      end,
    })

    require 'formatter'.setup {
      filetype = {
        lua = require 'formatter.filetypes.lua'.luaformatter,
        go = require 'formatter.filetypes.go'.goimports,
      }
    }
  end,
}
