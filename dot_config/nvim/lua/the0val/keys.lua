local m = require "the0val.bind"

-- Easy saving
m.nnoremap("<C-s>", "<cmd>w<CR>")

-- Faster split screen switching
m.nnoremap("<C-h>", "<C-w>h")
m.nnoremap("<C-j>", "<C-w>j")
m.nnoremap("<C-k>", "<C-w>k")
m.nnoremap("<C-l>", "<C-w>l")
-- ... and resizing
m.nnoremap("<M-j>", "<cmd>resize -2<CR>")
m.nnoremap("<M-k>", "<cmd>resize +2<CR>")
m.nnoremap("<M-h>", "<cmd>vertical resize -2<CR>")
m.nnoremap("<M-l>", "<cmd>vertical resize +2<CR>")

-- Faster scrolling
m.nnoremap("<C-e>", "3<C-e>")
m.nnoremap("<C-y>", "3<C-y>")

-- Exit terminal mode
m.tnoremap("<Esc>", "<C-\\><C-n>")
m.tnoremap("<C-k>", "<C-\\><C-n><C-k>")

-- Tabbing keeps visual selection
m.vnoremap("<", "<gv")
m.vnoremap(">", ">gv")

m.nnoremap("åy", '"+y')
m.nnoremap("åp", '"+p')
m.nnoremap("åP", '"+P')
m.vnoremap("åy", '"+y')
m.vnoremap("åp", '"+p')

-- Quick adding lines in normal mode
m.nnoremap("<Leader>o", "o<Esc>")
m.nnoremap("<Leader>O", "O<Esc>")
