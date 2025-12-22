return {
  'nvim-mini/mini.nvim',
  version = '*',
  lazy = false,
  config = function()
    -- Icon library used by many other things
    require('mini.icons').setup {}
    -- Sets many common options and autocommands
    require('mini.basics').setup {
      options = {
        extra_ui = true,
      },
      mappings = {
        windows = true,
      },
    }
    -- Insert matching () "" etc.
    require('mini.pairs').setup {}
    -- Better around/inside
    require('mini.ai').setup {}
    -- Session manager
    require('mini.sessions').setup {}
  end,
  keys = {},
}
