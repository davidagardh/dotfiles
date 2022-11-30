require("neogit").setup {}

local nnoremap = require "the0val.bind".nnoremap
nnoremap("<leader>G", "<cmd>Neogit<CR>")

require('gitsigns').setup()
