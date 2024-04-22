return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
    {
      's1n7ax/nvim-window-picker',
      opts = {
        hint = 'floating-big-letter',
      },
    },
  },
  config = function()
    require('neo-tree').setup {
      window = { position = 'current' },
      hijack_netrw_behavior = 'open_default',
    }
    -- Create shortcut for Neo-tree filetree
    vim.keymap.set('n', '<leader>f', '<cmd>Neotree position=current<CR>', { desc = '[F]ile tree' })
  end,
}
