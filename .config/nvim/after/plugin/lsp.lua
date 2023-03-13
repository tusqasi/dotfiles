local m = {}
local lsp = require('lsp-zero')

lsp.preset('recommended')

-- lsp.ensure_installed({
-- 	-- 'elixirls',
-- 	-- 'sumneko_lua',
--
-- })


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
	mapping = cmp_mappings
})




function m.on_attach(client, bufnr)
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

lsp.on_attach(on_attach)


local get_cursor_position = function()
	local rowcol = vim.api.nvim_win_get_cursor(0)
	local row = rowcol[1] - 1
	local col = rowcol[2]

	return row, col
end

lsp.configure('elixirls', {
	on_attach = function(client, bufnr)
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
