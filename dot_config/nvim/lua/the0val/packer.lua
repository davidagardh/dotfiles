-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

print "Adding packer"

return require("packer").startup(function(use)
	-- Packer can manage itself
	use "wbthomason/packer.nvim"

	-- Looks
	use "RRethy/nvim-base16"
	use {
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true }
	}
	-- Basics
	use "kylechui/nvim-surround"

	-- General IDE-like features
	use {
        "nvim-treesitter/nvim-treesitter",
        run = function() require("nvim-treesitter.install").update({ with_sync = true }) end,
    }
	use { "TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim" }
	use "lewis6991/gitsigns.nvim"
end)
