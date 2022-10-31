-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

print "Adding packer"

return require("packer").startup(function(use)
	-- Packer can manage itself
	use "wbthomason/packer.nvim"
	use "chriskempson/base16-vim"
end)
