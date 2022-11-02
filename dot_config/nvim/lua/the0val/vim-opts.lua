local vo = vim.opt

vo.guicursor = ""

vo.nu = true
vo.relativenumber = true

vo.errorbells = false

-- Real tabs, 4 chars
vo.tabstop = 4
vo.shiftwidth = 4
vo.expandtab = false

vo.smartindent = true

vo.wrap = false

vo.swapfile = false
vo.backup = false
vo.undofile = true

vo.hlsearch = false
vo.incsearch = true

vo.termguicolors = true

vo.scrolloff = 6
vo.signcolumn = "yes"

-- Give more space for displaying messages.
vo.cmdheight = 1

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vo.updatetime = 50

-- Don't pass messages to |ins-completion-menu|.
vo.shortmess:append("c")

vo.colorcolumn = "80"

vo.mouse = "a"
vo.timeoutlen = 500

vo.autochdir = true

vo.splitbelow = true
vo.splitright = true

vo.cursorline = true

vim.g.mapleader = " "

