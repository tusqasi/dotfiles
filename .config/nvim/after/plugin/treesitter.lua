require 'nvim-treesitter.configs'.setup {
	ensure_installed = { "c", "lua", "elixir", "css", "javascript", "typescript", "html" },
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn", -- set to `false` to disable one of the mappings
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ia"] = "@parameter.inner",
				["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
			},
		},
		swap = {
			enable = true,
			swap_next = {
				["<right>"] = "@parameter.inner",
			},
			swap_previous = {
				["<left>"] = "@parameter.inner",
			},
		},
	},
}
