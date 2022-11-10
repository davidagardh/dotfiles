-- Enable completion triggered by <c-x><c-o>
--vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

-- LSP mappings
local bufopts = { noremap=true, silent=true, buffer=bufnr }
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
--vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
vim.keymap.set("n", "<leader>cl", vim.lsp.codelens.run, bufopts)
vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
vim.keymap.set("n", "<leader>F", function() vim.lsp.buf.format { async = true } end, bufopts)

local cmp = require "cmp"
cmp.setup {
	sources = {
		{ name = "nvim_lsp" },
		{ name = "vsnip" },
	},
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end
	},
	mapping = cmp.mapping.preset.insert {
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end,
		["<S-Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end,
	}
}
