return require("packer").startup(
	function()
		-- Packer can manage itself
		use "wbthomason/packer.nvim"

		-- Bling
		-- use "gruvbox-community/gruvbox"
		use "dracula/vim"
		use "kyazdani42/nvim-web-devicons"
		use {
			"nvim-lualine/lualine.nvim",
			requires = { "kyazdani42/nvim-web-devicons", opt = true }
		}
		-- use "norcalli/nvim-colorizer.lua"
		use {
			"lewis6991/gitsigns.nvim",
			requires = {
				"nvim-lua/plenary.nvim"
			},
			config = function()
				require("gitsigns").setup()
			end
		}
		-- use {
		--     "stevearc/aerial.nvim",
		--     cmd = "AerialToggle",
		--     config = function()
		--         require("aerial").setup(
		--             {
		--                 filter_kind = false
		--             }
		--         )
		--     end
		-- }

		-- utils
		-- use "vifm/vifm.vim"
		-- use "dag/vim-fish"
		use "mattn/emmet-vim"
		use "christoomey/vim-tmux-navigator"
		use "tpope/vim-surround"
		-- use "rhysd/committia.vim"
		use "JoosepAlviste/nvim-ts-context-commentstring"
		use {
			"numToStr/Comment.nvim",
			config = function()
				require("Comment").setup()
			end
		}
		use "wellle/targets.vim"
		use "tpope/vim-repeat"
		use "sbdchd/neoformat"
		use "L3MON4D3/LuaSnip"
		-- use "github/copilot.vim"
		-- telescope thangs
		use {
			"nvim-telescope/telescope-file-browser.nvim",
			config = function()
				require("telescope").load_extension("file_browser")
			end
		}
		use {
			"nvim-telescope/telescope-ui-select.nvim",
			config = function()
				require("telescope").load_extension("ui-select")
			end
		}
		use {
			"nvim-telescope/telescope-frecency.nvim",
			config = function()
				require "telescope".load_extension("frecency")
			end,
			requires = { "tami5/sqlite.lua" }
		}
		use "folke/lua-dev.nvim"
		use "~/clones/friendly-snippets"
		use "junegunn/goyo.vim"
		use "andymass/vim-matchup"
		use "TimUntersberger/neogit"
		use "preservim/vimux"
		use {
			"benfowler/telescope-luasnip.nvim",
			config = function()
				require "telescope".load_extension("luasnip")
			end, -- if you wish to lazy-load
		}
		-- utils end --

		-- Lsp/treesitternvim.5+
		-- cmp
		use "f3fora/cmp-spell"
		use "hrsh7th/cmp-buffer"
		use "hrsh7th/cmp-cmdline"
		use "hrsh7th/cmp-nvim-lsp"
		use "hrsh7th/cmp-nvim-lua"
		use "hrsh7th/cmp-path"
		use "hrsh7th/nvim-cmp"

		-- lsp
		-- use "mfussenegger/nvim-jdtls"
		use "neovim/nvim-lspconfig"
		use "williamboman/nvim-lsp-installer"

		-- treesitter
		use {
			"nvim-treesitter/nvim-treesitter",
			run = function()
				require("nvim-treesitter.install").update({ with_sync = true })
			end
		}

		use "nvim-treesitter/nvim-treesitter-textobjects"
		-- use "nvim-treesitter/playground"

		-- telescope
		use {
			"nvim-telescope/telescope.nvim",
			requires = { "nvim-lua/plenary.nvim" }
		}
		-- Dart/Flutter
		use "dart-lang/dart-vim-plugin"
		use "thosakwe/vim-flutter"
		use {
			"akinsho/flutter-tools.nvim",
			config = function()
				require("telescope").load_extension("flutter")
			end
		}

		-- Coconut oiled
		use {
			"ThePrimeagen/harpoon",
			config = function()
				require("telescope").load_extension("harpoon")
			end
		}
		use { "ThePrimeagen/refactoring.nvim",
			config = function()
				require("telescope").load_extension("refactoring")
			end

		}
		use {
			"ThePrimeagen/git-worktree.nvim",
			config = function()
				require("telescope").load_extension("git_worktree")
			end
		}
	end
)
