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
    dependencies = {
      'bwpge/lualine-pretty-path',
    },
    opts = {
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = {
          { 'pretty_path', unnamed = '', directories = { enable = true, max_depth = 5 } },
        },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
    },
  },

  {
    'miversen33/sunglasses.nvim',
    event = 'UIEnter',
    opts = {
      filter_percent = 0.15,
    },
  },
}
