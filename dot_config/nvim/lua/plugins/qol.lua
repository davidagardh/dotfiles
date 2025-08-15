return {
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {},
    keys = {
      {
        '<leader>?',
        function()
          require('which-key').show { global = false }
        end,
        desc = 'Buffer Local Keymaps (which-key)',
      },
      {
        '<leader>g?',
        function()
          require('which-key').show { global = true }
        end,
        desc = 'Global Keymaps (which-key)',
      },
    },
  },
  {
    'ggandor/leap.nvim',
    -- leap is itself lazy
    lazy = false,
    config = function()
      vim.keymap.set('n', 's', '<Plug>(leap-forward)')
      vim.keymap.set('n', 'S', '<Plug>(leap-backward)')
      vim.keymap.set('x', 's', '<Plug>(leap)')
      vim.keymap.set('n', 'gs', '<Plug>(leap-from-window)')
    end,
  },

  {
    'kylechui/nvim-surround',
    version = '^3.*',
    event = 'VeryLazy',
    -- Keybinds:
    -- normal mode: ys, ds, cs
    -- visual mode: S
    -- insert mode: <C-g>s
    opts = {},
  },
}
