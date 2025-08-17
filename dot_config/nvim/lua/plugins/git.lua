return {
  {
    'lewis6991/gitsigns.nvim',
    event = 'BufEnter',
    opts = {
      on_attach = function(bufnr)
        local gs = require 'gitsigns'

        local function map(key, action, desc, mode)
          mode = mode or { 'n', 'v' }
          vim.keymap.set(mode, key, action, { desc = desc, buffer = bufnr })
        end

        map(']c', function()
          gs.nav_hunk 'next'
        end, 'Next Change')

        map('[c', function()
          gs.nav_hunk 'prev'
        end, 'Prev Change')

        map('<leader>hs', gs.stage_hunk, 'Stage Hunk', 'n')
        map('<leader>hr', gs.reset_hunk, 'Reset Hunk', 'n')

        map('<leader>hs', function()
          gs.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, 'Stage Hunk', 'v')

        map('<leader>hs', function()
          gs.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, 'Reset Hunk', 'v')

        map('<leader>hd', gs.diffthis, 'Hunk Diff')
      end,
    },
  },

  {
    'NeogitOrg/neogit',
    cmd = 'Neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim', -- Diff integration
      'folke/snacks.nvim', -- for picker
    },
    opts = {
      kind = 'floating',
    },
    keys = {
      {
        '<leader>G',
        '<cmd>Neogit<cr>',
        desc = 'Neogit',
      },
    },
  },

  {
    'akinsho/git-conflict.nvim',
    enabled = false,
    version = '*',
    event = 'VeryLazy',
    opts = {},
  },
}
