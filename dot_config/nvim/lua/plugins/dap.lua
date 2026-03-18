return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      {
        'rcarriga/nvim-dap-ui',
        dependencies = { 'nvim-neotest/nvim-nio' },
        opts = {},
      },
      {
        'leoluz/nvim-dap-go',
        opts = {},
      },
      'mason-org/mason.nvim',
    },
    keys = {
      {
        '<F5>',
        function()
          require('dap').continue()
        end,
        desc = 'Debug: Start/Continue',
      },
      {
        '<leader>b',
        function()
          require('dap').toggle_breakpoint()
        end,
        desc = 'Debug: Start/Continue',
      },
      {
        '<F1>',
        function()
          require('dap').step_into()
        end,
        desc = 'Debug: Step Into',
      },
      {
        '<F2>',
        function()
          require('dap').step_over()
        end,
        desc = 'Debug: Step Over',
      },
      {
        '<F3>',
        function()
          require('dap').step_out()
        end,
        desc = 'Debug: Step Out',
      },
      {
        '<F7>',
        function()
          require('dapui').toggle()
        end,
        desc = 'Debug: Toggle UI',
      },
    },
    config = function()
      local dap = require 'dap'
      local dapui = require 'dapui'
      dap.listeners.after.event_initialized['dapui_config'] = dapui.open
      dap.listeners.before.event_terminated['dapui_config'] = dapui.close
      dap.listeners.before.event_exited['dapui_config'] = dapui.close

      local mason = vim.env.MASON or (vim.fn.stdpath 'data' .. '/mason')
      local lua_extension = mason .. '/share/local-lua-debugger-vscode'
      local lua_debugger = lua_extension .. '/extension/debugAdapter.js'
      dap.adapters['local-lua'] = {
        type = 'executable',
        command = 'node',
        args = { lua_debugger },
      }
      dap.configurations.lua = {
        {
          type = 'local-lua',
          request = 'launch',
          name = 'Launch current file (Lua)',
          extensionPath = lua_extension,
          cwd = '${workspaceFolder}',
          program = {
            lua = 'lua',
            file = '${file}',
          },
          args = {},
        },
      }
    end,
  },
}
