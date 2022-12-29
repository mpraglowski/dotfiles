local fn = vim.fn
local execute = vim.api.nvim_command
local packer = require("packer")
local use = packer.use

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({
		"git",
		"clone",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	execute("packadd packer.nvim")
end

return packer.startup(function()
	-- Packer can manage itself
	use({ "wbthomason/packer.nvim" })
	-- Nvim Tree for file exploring
	use({
		"kyazdani42/nvim-tree.lua",
		requires = { { "kyazdani42/nvim-web-devicons" } },
		config = function()
			require("nvim-tree").setup({})
		end,
	})
	use({
		"lambdalisue/glyph-palette.vim",
		config = function()
			vim.cmd([[augroup my-glyph-palette]])
			vim.cmd([[autocmd! *]])
			vim.cmd([[autocmd FileType fern call glyph_palette#apply()]])
			vim.cmd([[autocmd FileType nerdtree,startify call glyph_palette#apply()]])
			vim.cmd([[augroup END]])
		end,
	})
	-- Native LSP for neovim
	use({ "nvim-lua/plenary.nvim" })
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	})
	use({
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("plugins.null-ls")
		end,
		requires = { "nvim-lua/plenary.nvim" },
	})
	use({
		"neovim/nvim-lspconfig",
		requires = {
			{ "jose-elias-alvarez/null-ls.nvim" },
		},
	})
	-- Autocompletion
	use({ "hrsh7th/nvim-cmp" }) -- Autocompletion plugin
	use({ "hrsh7th/cmp-nvim-lsp" }) -- LSP source for nvim-cmp
	use({ "saadparwaiz1/cmp_luasnip" }) -- Snippets source for nvim-cmp
	use({ "L3MON4D3/LuaSnip" }) -- Snippets plugin
	-- Formatter
	use({
		"MunifTanjim/prettier.nvim",
		config = function()
			require("plugins.prettier")
		end,
	})
	-- Tresitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			{ "tami5/sqlite.lua" },
			{ "nvim-lua/popup.nvim" },
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
			{ "nvim-telescope/telescope-frecency.nvim" },
			{ "nvim-telescope/telescope-github.nvim" },
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-cmdline" },
			{ "hrsh7th/vim-vsnip" },
			{ "hrsh7th/vim-vsnip-integ" },
			{
				"hrsh7th/cmp-nvim-lsp",
				config = function()
					require("cmp").setup({
						sources = {
							{ name = "nvim_lsp" },
						},
					})
				end,
			},
			{ "mfussenegger/nvim-dap" },
			{ "nvim-telescope/telescope-dap.nvim" },
			{
				"suketa/nvim-dap-ruby",
				config = function()
					require("dap-ruby").setup()
				end,
			},
		},
		config = function()
			require("plugins.telescope")
		end,
	})
	-- Status line
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		config = function()
			require("plugins.lualine")
		end,
	})
	-- Git
	use({ "tpope/vim-fugitive" })
	use({
		"lewis6991/gitsigns.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
		},
		config = function()
			require("gitsigns").setup({
				current_line_blame = true,
			})
		end,
	})
	-- Strip trailing whitespace as you are editing
	use({
		"lewis6991/spaceless.nvim",
		config = function()
			require("spaceless").setup()
		end,
	})
	-- Autoclose tags
	use({ "windwp/nvim-ts-autotag" })
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("plugins.nvim-autopairs")
		end,
	})
	-- Focus mode
	use({
		"folke/twilight.nvim",
		config = function()
			require("twilight").setup()
		end,
	})
	use({
		"folke/zen-mode.nvim",
		config = function()
			require("zen-mode").setup()
		end,
	})
	-- Search
	use({ "Numkil/ag.nvim" })
	-- Other
	use({ "nathom/filetype.nvim" })
	use({ "qpkorr/vim-bufkill" })
	-- UI (colorschemes)
	use({ "atelierbram/Base2Tone-vim" })
end)
