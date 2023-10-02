local lsp = require('lsp-zero')

lsp.preset('recommended')

local cmp = require("cmp")
local luasnip = require("luasnip")
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-e>"] = cmp.mapping(function(fallback)
		if luasnip.expand_or_jumpable() then
			luasnip.expand_or_jump()
		else
			fallback()
		end
	end, { "i", "s" }),
	["<C-q>"] = cmp.mapping(function(fallback)
		if luasnip.jumpable(-1) then
			luasnip.jump(-1)
		else
			fallback()
		end
	end, { "i", "s" }),
	["<CR>"] = cmp.mapping.confirm({
		behavior = cmp.ConfirmBehavior.Insert,
		select = true,
	}),
	["<C-Space>"] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
	-- sources =
	-- 	lsp.defaults.cmp_sources({
	-- { name = "copilot", group_index = 2 },
	-- 	})
})

lsp.on_attach(vim.g.lsp_on_attach)

local get_cursor_position = function()
	local rowcol = vim.api.nvim_win_get_cursor(0)
	local row = rowcol[1] - 1
	local col = rowcol[2]

	return row, col
end

lsp.configure('elixirls', {
	on_attach = function(client, _)
		local options = { buffer = true, noremap = true }



		local function manipulate_pipes(direction, client_)
			local row, col = get_cursor_position()

			client_.request_sync("workspace/executeCommand", {
				command = "manipulatePipes:serverid",
				arguments = { direction, "file://" .. vim.api.nvim_buf_get_name(0), row, col },
			}, nil, 0)
		end

		local function from_pipe(client_)
			return function()
				manipulate_pipes("fromPipe", client_)
			end
		end

		local function to_pipe(client_)
			return function()
				manipulate_pipes("toPipe", client_)
			end
		end

		-- Remove the pipe operator
		vim.keymap.set("n", "<space>.", from_pipe(client), options)
		-- Add the pipe operator
		vim.keymap.set("n", "<space>,", to_pipe(client), options)
	end
})
lsp.setup()
