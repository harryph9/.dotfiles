local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost setup.lua source <afile> | PackerSync
  augroup end
]])

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	use("nvim-lua/plenary.nvim")

	use("numToStr/Comment.nvim")

	use("nvim-tree/nvim-web-devicons")

	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })

	use("hrsh7th/nvim-cmp")

	use("hrsh7th/cmp-buffer")

	use("hrsh7th/cmp-path")

	use("L3MON4D3/LuaSnip")

	use("saadparwaiz1/cmp_luasnip")

	use("rafamadriz/friendly-snippets")

	use("williamboman/mason.nvim")

	use("williamboman/mason-lspconfig.nvim")

	use("neovim/nvim-lspconfig")

	use("hrsh7th/cmp-nvim-lsp")

	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
		requires = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	})

	use("onsails/lspkind.nvim")

	use("jose-elias-alvarez/null-ls.nvim")

	use("jayp0521/mason-null-ls.nvim")

	use("lewis6991/gitsigns.nvim")

	use("windwp/nvim-autopairs")

	use("akinsho/nvim-bufferline.lua")

	use("andweeb/presence.nvim")

	use("nvim-neo-tree/neo-tree.nvim")

	use("MunifTanjim/nui.nvim")

	use("norcalli/nvim-colorizer.lua")

	use({
		"rose-pine/neovim",
		as = "rose-pine",
		config = function()
			vim.cmd("colorscheme rose-pine")
		end,
	})

	use("nvim-lualine/lualine.nvim")

	use("lukas-reineke/indent-blankline.nvim")

	if packer_bootstrap then
		require("packer").sync()
	end
end)
