local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")
	-- lsp
	use("neovim/nvim-lspconfig")
	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
	})

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	-- LuaLine
	use({
		"hoob3rt/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	-- Autocomplete
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-cmdline", -- command line
			"hrsh7th/cmp-buffer", -- buffer completions
			"hrsh7th/cmp-nvim-lua", -- nvim config completions
			"hrsh7th/cmp-nvim-lsp", -- lsp completions
			"hrsh7th/cmp-path", -- file path completions
			"saadparwaiz1/cmp_luasnip", -- snippets completions
            'hrsh7th/cmp-nvim-lsp-signature-help' -- signature help
		},
	})


	-- snippets
	use({
		"L3MON4D3/LuaSnip",
		requires = {
			"rafamadriz/friendly-snippets",
		},
	})

	-- tpope
	use("tpope/vim-fugitive")
	use("tpope/vim-surround")


	-- commenting
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use({ "numToStr/Comment.nvim", tag = "v0.6" })

	-- windwp
	use("windwp/nvim-ts-autotag") -- auto close and rename tags
	use("windwp/nvim-autopairs")
	use("windwp/nvim-spectre") -- Spectre for find and replace

	-- Formatting
	use("mhartington/formatter.nvim")
	use("airblade/vim-gitgutter")

	-- hightlight matching tag in html,jsx etc.
	use("leafOfTree/vim-matchtag")

	use({
		"phaazon/hop.nvim",
		as = "hop",
		config = function()
			require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
		end,
	})

	-- Undotree
	use("mbbill/undotree")

	-- file tree
	use("kyazdani42/nvim-tree.lua")

	-- icons
	use("kyazdani42/nvim-web-devicons")

	-- icons in completion
	use("onsails/lspkind-nvim")
 -- preferred colorscheme
	use("gruvbox-community/gruvbox")
  use("bluz71/vim-nightfly-guicolors")
  use("EdenEast/nightfox.nvim")
	-- autosave
	use("Pocco81/auto-save.nvim")
	-- hover
	use("lewis6991/hover.nvim")

	-- Trouble
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({})
		end,
	})
	-- WhichKey
	use("folke/which-key.nvim")
	-- Todo comments
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({})
		end,
	})

	-- Colorizer
	use("norcalli/nvim-colorizer.lua")
	-- jsonc file type for json - comments in json
	use("kevinoid/vim-jsonc")

	-- bufferline for buffers in 'tabs'
	use({ "akinsho/bufferline.nvim", tag = "*", requires = "kyazdani42/nvim-web-devicons" })
    use ("lukas-reineke/indent-blankline.nvim")
	-- better code action menu
	use({
		"weilbith/nvim-code-action-menu",
		cmd = "CodeActionMenu",
	})
	-- firebase rules
	use("delphinus/vim-firestore")
    use( "folke/zen-mode.nvim")

	-- sessions
	use({
		"rmagatti/auto-session",
		config = function()
			require("auto-session").setup({
				log_level = "error",
				auto_session_suppress_dirs = { "~/", "~/Projects" },
			})
		end,
	})

	use({
		"rmagatti/session-lens",
		config = function()
			require("session-lens").setup({ --[[your custom config--]]
			})
		end,
	})
	-- Rich presence in Discord
	use("andweeb/presence.nvim")

	-- Dashboard
	use("goolord/alpha-nvim")

	use('lewis6991/gitsigns.nvim')


  -- toggle term
use { "akinsho/toggleterm.nvim", config = "require('toggleterm-settings')" }
use "terrortylor/nvim-comment"
use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
        require('lspsaga').setup({})
    end,
})

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end
end)
