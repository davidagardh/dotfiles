local function map(lhs, rhs, desc, mode)
  desc = desc or ''
  mode = mode or 'n'
  vim.keymap.set(mode, lhs, rhs, { desc = desc })
end

map('<esc>', '<cmd>nohlsearch<CR>')
map('+', '"+', '', { 'n', 'x' })
map('<leader>a', '<C-^>', 'Alternate file')
map('gb', '<cmd>bn<CR>', 'Next buffer')
map('gB', '<cmd>bp<CR>', 'Prev buffer')
map('<leader>d', '<cmd>bd<CR>', 'Delete buffer')
