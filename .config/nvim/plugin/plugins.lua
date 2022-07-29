return require("packer").startup(function()
	-- System
	use("wbthomason/packer.nvim")
	use("lewis6991/impatient.nvim")

	-- Bling
	-- use "gruvbox-community/gruvbox"
	use("dracula/vim")
	use("overcache/NeoSolarized")
	use("kyazdani42/nvim-web-devicons")
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
	-- use "norcalli/nvim-colorizer.lua"
	use({
		"lewis6991/gitsigns.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("gitsigns").setup()
		end,
	})
	use({ "xiyaowong/nvim-transparent", config = [[vim.cmd("TransparentEnable")]], event = "VimEnter" })
	-- Bling end --

	-- utils
	-- use "vifm/vifm.vim"
	-- use "dag/vim-fish"
	-- use "mattn/emmet-vim"
	use("tpope/vim-surround")
	use("tpope/vim-endwise")
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})
	use("preservim/vimux")

	-- movement
	use("wellle/targets.vim")
	use("tpope/vim-repeat")
	use("andymass/vim-matchup")
	use({
		"christoomey/vim-tmux-navigator",
		config = function()
			vim.g.tmux_navigator_disable_when_zoomed = true
		end,
	})

	use("sbdchd/neoformat")
	-- use "github/copilot.vim"

	-- snippets
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")
	use({
		"junegunn/goyo.vim",
		ft = { "md" },
		cmd = "Goyo",
		config = function()
			vim.api.nvim_exec(
				[[
									function! s:goyo_enter()
										set nolist
									endfunction

									function! s:goyo_leave()
										set list

									endfunction

									autocmd! User GoyoEnter nested call <SID>goyo_enter()
									autocmd! User GoyoLeave nested call <SID>goyo_leave()
									]],
				true
			)
		end,
	})
	-- use {
	--     "benfowler/telescope-luasnip.nvim",
	--     config = function()
	--         require "telescope".load_extension("luasnip")
	--     end -- if you wish to lazy-load
	-- }

	-- git stuff
	use("TimUntersberger/neogit")
	use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })
	use("rhysd/committia.vim")

	-- utils end --

	-- completions
	-- use "f3fora/cmp-spell"
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/cmp-nvim-lsp")
	-- use "hrsh7th/cmp-nvim-lua"
	use("hrsh7th/cmp-path")
	use("hrsh7th/nvim-cmp")

	-- lsp
	-- use "mfussenegger/nvim-jdtls"
	use("neovim/nvim-lspconfig")
	use("williamboman/nvim-lsp-installer")
	use("WhoIsSethDaniel/toggle-lsp-diagnostics.nvim")
	use("folke/lua-dev.nvim")
	use({
		"ray-x/lsp_signature.nvim",
	})

	-- treesitter
	--
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})

	use("nvim-treesitter/nvim-treesitter-textobjects")
	-- use "nvim-treesitter/playground"

	-- telescope thangs
	use({
		"nvim-telescope/telescope.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})
	-- extensions
	use({
		"nvim-telescope/telescope-file-browser.nvim",
		config = function()
			require("telescope").load_extension("file_browser")
		end,
	})
	use({
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").load_extension("ui-select")
		end,
	})
	use({
		"nvim-telescope/telescope-frecency.nvim",
		config = function()
			require("telescope").load_extension("frecency")
		end,
		requires = { "tami5/sqlite.lua" },
	})

	-- Dart/Flutter
	use("dart-lang/dart-vim-plugin")
	use("thosakwe/vim-flutter")
	use({
		"akinsho/flutter-tools.nvim",
		config = function()
			require("telescope").load_extension("flutter")
		end,
	})

	-- debugging
	use("mfussenegger/nvim-dap")
	-- use "leoluz/nvim-dap-go"
	use("rcarriga/nvim-dap-ui")
	use("theHamsta/nvim-dap-virtual-text")
	use("nvim-telescope/telescope-dap.nvim")

	-- Coconut oiled
	use({
		"ThePrimeagen/harpoon",
		config = function()
			require("telescope").load_extension("harpoon")
		end,
	})
	-- use {
	--     "ThePrimeagen/refactoring.nvim",
	--     config = function()
	--         require("telescope").load_extension("refactoring")
	--     end
	-- }
	use({
		"ThePrimeagen/git-worktree.nvim",
		config = function()
			require("telescope").load_extension("git_worktree")
		end,
	})
end)
