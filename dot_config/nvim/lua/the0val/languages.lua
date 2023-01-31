-- Language specific settings and overrides

function useTwoSpaces()
	vim.bo.tabstop = 2
	vim.bo.softtabstop = 2
	vim.bo.shiftwidth = 2
	vim.bo.expandtab = true
end

vim.api.nvim_create_augroup("filetypecheck", { clear = true })
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
	group = "filetypecheck",
	pattern = {"*.scala", "build.sbt", "*.py"},
	callback = useTwoSpaces
})
