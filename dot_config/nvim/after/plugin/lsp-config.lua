-- Typescript language server
require'lspconfig'.tsserver.setup{}
-- R language server
require'lspconfig'.r_language_server.setup{
	filetypes = {"r"}
}
