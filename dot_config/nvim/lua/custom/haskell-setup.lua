local ht = require 'haskell-tools'
local bufnr = vim.api.nvim_get_current_buf()

local nmap = function(keys, func, desc)
  if desc then
    desc = 'Haskell: ' .. desc
  end

  vim.keymap.set('n', keys, func, { noremap = true, silent = true, desc = desc })
  print 'running here'
end

-- haskell-language-server relies heavily on codeLenses,
-- so auto-refresh (see advanced configuration) is enabled by default
nmap('<leader>cl', vim.lsp.codelens.run, '[C]ode [l]ens')
-- Hoogle search for the type signature of the definition under the cursor
nmap('<leader>hs', ht.hoogle.hoogle_signature, '[H]oogle [k]ey info')
-- Evaluate all code snippets
nmap('<leader>ea', ht.lsp.buf_eval_all, 'ht [e]val [a]ll')
-- Toggle a GHCi repl for the current package
nmap('<leader>rr', ht.repl.toggle, 'ht [rr]epl package')
-- Toggle a GHCi repl for the current buffer
nmap('<leader>rf', function()
  ht.repl.toggle(vim.api.nvim_buf_get_name(0))
end, 'ht [r]epl bu[f]fer')
nmap('<leader>rq', ht.repl.quit, 'ht [r]epl [q]uit')
