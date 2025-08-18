return {
  {
    'sainnhe/sonokai',
    priority = 1000,
    lazy = false,
    config = function()
      vim.cmd.colorscheme 'sonokai'
    end,
  },

  {
    'nvim-neo-tree/neo-tree.nvim',
    lazy = false,
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    opts = {
      close_if_last_window = true,
      source_selector = {
        winbar = true,
      },
      sources = { 'filesystem', 'git_status' },
    },
    keys = {
      { '<leader>f', '<cmd>Neotree<CR>', desc = 'File Tree' },
    },
  },

  {
    'akinsho/bufferline.nvim',
    opts = {},
    event = 'BufEnter',
    keys = {
      { ']b', '<cmd>BufferLineCycleNext<CR>', desc = 'Next Buffer' },
      { '[b', '<cmd>BufferLineCyclePrev<CR>', desc = 'Prev Buffer' },
      { ']B', '<cmd>BufferLineMoveNext<CR>', desc = 'Move Buffer' },
      { '[B', '<cmd>BufferLineMovePrev<CR>', desc = 'Move Buffer' },
    },
  },

  {
    'nvim-lualine/lualine.nvim',
    event = 'BufEnter',
    opts = {},
  },
}
