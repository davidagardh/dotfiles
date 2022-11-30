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

m.nnoremap("<Leader>f", "<cmd>NvimTreeToggle<CR>")

-- For language server and such
local bufopts = { noremap=true, silent=true, buffer=bufnr }
m.nnoremap("gD", vim.lsp.buf.declaration)
m.nnoremap("gd", vim.lsp.buf.definition)
m.nnoremap("K", vim.lsp.buf.hover)
m.nnoremap("gi", vim.lsp.buf.implementation)
m.nnoremap("gr", vim.lsp.buf.references)
--m.nnoremap("<C-k>", vim.lsp.buf.signature_help)
m.nnoremap("<Leader>cl", vim.lsp.codelens.run)
m.nnoremap("<Leader>D", vim.lsp.buf.type_definition)
m.nnoremap("<Leader>rn", vim.lsp.buf.rename)
m.nnoremap("<Leader>ca", vim.lsp.buf.code_action)
m.nnoremap("<Leader>F", function() vim.lsp.buf.format { async = true } end)

-- DAP Debugger
m.nnoremap("<Leader>dt", require"dap".toggle_breakpoint)
m.nnoremap("<Leader>dc", require"dap".continue)
m.nnoremap("<Leader>dso", require"dap".stop_over)
m.nnoremap("<Leader>dsi", require"dap".stop_into)
m.nnoremap("<Leader>dK", require"dap.ui.widgets".hover)
m.nnoremap("<Leader>dl", require"dap".run_last)
m.nnoremap("<Leader>dr", require"dap".repl.toggle)
