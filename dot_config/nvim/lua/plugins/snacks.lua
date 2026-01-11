---@module 'snacks'
return {
  'folke/snacks.nvim',
  lazy = false,
  priority = 900,
  opts = {
    statuscolumn = {},

    dashboard = {
      preset = {
        keys = {
          {
            icon = ' ',
            key = 'f',
            desc = 'File Tree',
            action = '<cmd>Neotree<CR>',
          },
          { icon = '󰊢 ', key = 'G', desc = 'Neogit', action = ':Neogit' },
          { icon = ' ', key = 'n', desc = 'New File', action = ':ene | startinsert' },
          {
            icon = ' ',
            key = 'g',
            desc = 'Find Text',
            action = function()
              Snacks.dashboard.pick 'live_grep'
            end,
          },
          {
            icon = ' ',
            key = 'r',
            desc = 'Recent Files',
            action = function()
              Snacks.dashboard.pick 'oldfiles'
            end,
          },
          {
            icon = ' ',
            key = 'c',
            desc = 'Config',
            action = function()
              Snacks.dashboard.pick('files', { cwd = '~/.local/share/chezmoi/dot_config/nvim/' })
            end,
          },
          { icon = ' ', key = 's', desc = 'Restore Session', section = 'session' },
          { icon = '󰒲 ', key = 'L', desc = 'Lazy', action = ':Lazy', enabled = package.loaded.lazy ~= nil },
          { icon = '󰏗 ', key = 'M', desc = 'Mason', action = ':Mason' },
          { icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
        },
      },
    },

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
          self.esc_timer = self.esc_timer or vim.uv.new_timer()
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
      '<leader>q',
      function()
        Snacks.bufdelete()
      end,
      'Close Buffer',
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
      '<leader>sg',
      function()
        Snacks.picker.grep()
      end,
      desc = 'Grep Files',
    },
    {
      '<leader>sc',
      function()
        Snacks.picker.files { cwd = '~/.local/share/chezmoi/dot_config/nvim/' }
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
    {
      '<leader>sk',
      function()
        Snacks.picker.keymaps()
      end,
      desc = 'keymaps',
    },
    {
      '<leader>ss',
      function()
        Snacks.picker.pickers()
      end,
      desc = 'Pickers',
    },
  },
}
