return {
  'folke/snacks.nvim',
  lazy = false,
  priority = 900,
  opts = {
    statuscolumn = {},
    dashboard = {},
    terminal = {
      gf = function(self)
        local f = vim.fn.findfile(vim.fn.expand '<cfile>', '**')
        if f == '' then
          Snacks.notify.warn 'No file under cursor'
        else
          self:hide()
          vim.schedule(function()
            vim.cmd('e ' .. f)
          end)
        end
      end,
      term_normal = {
        '<esc>',
        function(self)
          self.esc_timer = self.esc_timer or (vim.uv or vim.loop).new_timer()
          if self.esc_timer:is_active() then
            self.esc_timer:stop()
            vim.cmd 'stopinsert'
          else
            self.esc_timer:start(200, 0, function() end)
            return '<esc>'
          end
        end,
        mode = 't',
        expr = true,
        desc = 'Double escape to normal mode',
      },
    },
    picker = {},
  },
  keys = {
    {
      '<M-t>',
      function()
        Snacks.terminal()
      end,
      mode = { 'n', 'v', 't' },
      desc = 'Toggle Terminal',
    },
    {
      '<leader><space>',
      function()
        Snacks.picker.smart()
      end,
      desc = 'Smart Find Files',
    },
    {
      '<leader>sh',
      function()
        Snacks.picker.help()
      end,
      desc = 'Help Pages',
    },
    {
      '<leader>sc',
      function()
        Snacks.picker.files { cwd = vim.fn.stdpath 'config' }
      end,
      desc = 'Help Pages',
    },
    {
      '<leader>sm',
      function()
        Snacks.picker.marks()
      end,
      desc = 'Marks',
    },
  },
}
