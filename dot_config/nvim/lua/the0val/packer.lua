-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
	-- Packer can manage itself
	use "wbthomason/packer.nvim"

	-- nvim config improvements
	use "svermeulen/vimpeccable"

	-- Looks
	use "RRethy/nvim-base16"
	use {
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true }
	}
	-- Basics
	use "kylechui/nvim-surround"
	use {
		"nvim-tree/nvim-tree.lua",
		requires = { "kyazdani42/nvim-web-devicons", opt = true }
	}
	use { "nvim-telescope/telescope.nvim", requires = "nvim-lua/plenary.nvim" }

	-- General IDE-like features
	use {
        "nvim-treesitter/nvim-treesitter",
        run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
    }
	use { "TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim" }
	use "lewis6991/gitsigns.nvim"
	use "mfussenegger/nvim-dap"
	use "rcarriga/nvim-dap-ui"
	use {
		"hrsh7th/nvim-cmp",
		requires = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-vsnip" },
			{ "hrsh7th/vim-vsnip" },
		},
	}
	use 'neovim/nvim-lspconfig'

	-- Language features
	use {
		"scalameta/nvim-metals",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	}
end)
