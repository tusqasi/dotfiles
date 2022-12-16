return require("packer").startup(function(use)
	-- System
	use("wbthomason/packer.nvim")
	use("lewis6991/impatient.nvim")

	-- Bling
	-- use("RRethy/nvim-base16")
	use({ "shaunsingh/solarized.nvim" })
	use({
		"catppuccin/nvim",
		as = "catppuccin",
		config = function()
			vim.g.catppuccin_flavour = "latte" -- latte, frappe, macchiato, mocha
			require("catppuccin").setup()
		end,
	})
	use("kyazdani42/nvim-web-devicons")
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
	use({
		"lewis6991/gitsigns.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("gitsigns").setup()
		end,
	})
	use({
		"rcarriga/nvim-notify",
		config = function()
			require("notify").setup({
				background_colour = "#000000",
			})
		end,
	})
	-- Bling end --

	-- utils
	use("mattn/emmet-vim")
	use("tpope/vim-endwise")
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup({
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})
		end,
	})
	-- use("preservim/vimux")

	-- movement
	use("wellle/targets.vim")
	use({ "andymass/vim-matchup", config = function() end })
	use({
		"christoomey/vim-tmux-navigator",
		config = function()
			vim.g.tmux_navigator_disable_when_zoomed = true
		end,
	})

	use("sbdchd/neoformat")

	-- snippets
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")
	-- end snippets
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
	use({
		"benfowler/telescope-luasnip.nvim",
		config = function()
			require("telescope").load_extension("luasnip")
		end, -- if you wish to lazy-load
	})

	-- git stuff
	use("TimUntersberger/neogit")
	use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })
	-- use("rhysd/committia.vim")
	use({
		"kylechui/nvim-surround",
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	})
	use({ "mbbill/undotree" })
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "make",
	})
	use({
		"mizlan/iswap.nvim",
		config = function()
			require("iswap").setup()
		end,
	})
	use({ "tommcdo/vim-lion" })
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
	-- use({
	-- 	"williamboman/mason.nvim",
	-- 	config = function()
	-- 		require("mason").setup()
	-- 	end,
	-- })
	-- use({ "williamboman/mason-lspconfig.nvim" })

	use("WhoIsSethDaniel/toggle-lsp-diagnostics.nvim")
	use("folke/neodev.nvim")
	use({
		"ray-x/lsp_signature.nvim",
		config = function()
			local config = {
				floating_window = true,
				transperency = 100,
			}
			require("lsp_signature").setup(config)
			vim.keymap.set({ "i", "v", "s" }, "<Space>F", function()
				require("lsp_signature").toggle_float_win()
			end, { silent = true, noremap = true, desc = "toggle signature" })
		end,
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
	-- use("nvim-treesitter/playground")

	-- telescope thangs
	use({
		"nvim-telescope/telescope.nvim",
		-- "tusqasi/telescope.nvim",
		-- branch = "register-sort-patch",
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
	-- use({ "nvim-telescope/telescope-symbols.nvim" })
	-- end telescope thangs

	-- Dart/Flutter
	-- use("dart-lang/dart-vim-plugin")
	-- use("thosakwe/vim-flutter")
	-- use({
	-- 	"akinsho/flutter-tools.nvim",
	-- 	config = function()
	-- 		require("telescope").load_extension("flutter")
	-- 	end,
	-- })

	-- debugging
	-- use("mfussenegger/nvim-dap")
	-- use "leoluz/nvim-dap-go"
	-- use("rcarriga/nvim-dap-ui")
	-- use("theHamsta/nvim-dap-virtual-text")
	-- use("nvim-telescope/telescope-dap.nvim")

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
	-- use({
	-- 	"ThePrimeagen/git-worktree.nvim",
	-- 	config = function()
	-- 		require("telescope").load_extension("git_worktree")
	-- 	end,
	-- })
end)
