-- Typescript language server
require'lspconfig'.tsserver.setup{}

-- R language server
require'lspconfig'.r_language_server.setup{
	filetypes = {"r"}
}

require'lspconfig'.gopls.setup{}
--
-- Clojure lsp installed from https://github.com/clojure-lsp/clojure-lsp/releases
require'lspconfig'.clojure_lsp.setup{}
