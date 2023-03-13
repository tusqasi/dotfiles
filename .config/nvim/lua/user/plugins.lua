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

local packer_bootstrap = ensure_packer()


function on_attach(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	-- vim.keymap.set("n", "<leader>s", function() vim.lsp.buf.workspace_symbol() end, opts)
	vim.keymap.set("n", "gl", function() vim.diagnostic.open_float() end, opts)
	vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
	vim.keymap.set("n", "<leader>a", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>rr", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set("i", "C-f", function() vim.lsp.buf.signature_help() end, opts)
end

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	-- treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use({ "nvim-treesitter/nvim-treesitter-textobjects" })
	use({ "JoosepAlviste/nvim-ts-context-commentstring" })


	-- very nice
	use({ "mbbill/undotree" })
	use({ "christoomey/vim-tmux-navigator" })
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup({
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})
		end,
	})

	-- lsp
	use({
		"akinsho/flutter-tools.nvim",
		config = function()
			require "flutter-tools".setup(
				{
					fvm = true,
					lsp = {
						on_attach = on_attach,
					}
				}

			)
		end
	})
	use({
		"VonHeikemen/lsp-zero.nvim",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
	})


	-- very niiiice
	use({
		"ThePrimeagen/harpoon", -- 🥥
		config = function()
			require("telescope").load_extension("harpoon")
		end,
	})
	use({
		"nvim-telescope/telescope.nvim", -- 🔭
		requires = { { "nvim-lua/plenary.nvim" } },
		config = function()
			require("telescope").load_extension("flutter")
		end
	})

	use({
		"folke/neodev.nvim",
		config = function()
			require("neodev").setup({})
		end
	})

	use({
		"dstein64/vim-startuptime",
		cmd = "StartupTime",
		config = function()
			vim.g.startuptime_tries = 10
		end,
	})
	use {
		"ray-x/lsp_signature.nvim",
		config = function()
			local cfg = {} -- add your config here
			require "lsp_signature".setup(cfg)
		end
	}
	use({ "NLKNguyen/papercolor-theme" })
	use({
		"nvim-treesitter/nvim-treesitter-context",
		config = function()
			require "treesitter-context".setup(
				{
					max_lines = 1,
					patterns = {
						elixir = {
							"anonymous_function",
							"arguments",
							"block",
							"do_block",
						}
					},
				}
			)
		end
	})

	use({ 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' })

	use({
		"mattn/emmet-vim",
		ft = { "js", "jsx", "ts", "tsx", "html", "css", "vue" }
	})

	use({
		"kylechui/nvim-surround",
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end
	})
	use({ "tpope/vim-eunuch" })
	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
