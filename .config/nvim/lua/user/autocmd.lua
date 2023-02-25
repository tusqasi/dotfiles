local group = vim.api.nvim_create_augroup("formatting", {})

local function AutoSaveNFormat()
	if vim.g.__auto_save_n_format then
		vim.lsp.buf.format({ TabWidth = 4, IndentWidth = 4 })
		vim.cmd("update")
	end
end

vim.api.nvim_create_autocmd({ "InsertLeave" }, {
	callback = AutoSaveNFormat,
	pattern = "*.*",
	group = group,
})
