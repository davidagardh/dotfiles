local m = require "vimp"

vim.g.mapleader = " "
m.add_chord_cancellations('n', '<leader>')
m.always_override = true

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

local bufopts = { noremap=true, silent=true, buffer=bufnr }
m.nnoremap("gD", vim.lsp.buf.declaration)
m.nnoremap("gd", vim.lsp.buf.definition)
m.nnoremap("K", vim.lsp.buf.hover)
m.nnoremap("gi", vim.lsp.buf.implementation)
m.nnoremap("gr", vim.lsp.buf.references)
--m.nnoremap("<C-k>", vim.lsp.buf.signature_help)
m.nnoremap("<leader>cl", vim.lsp.codelens.run)
m.nnoremap("<leader>D", vim.lsp.buf.type_definition)
m.nnoremap("<leader>rn", vim.lsp.buf.rename)
m.nnoremap("<leader>ca", vim.lsp.buf.code_action)
m.nnoremap("<leader>F", function() vim.lsp.buf.format { async = true } end)
