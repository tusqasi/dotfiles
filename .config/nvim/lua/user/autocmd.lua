local group = vim.api.nvim_create_augroup("formatting", {})

local function AutoSaveNFormat()
	if vim.g.__auto_save_n_format then
		vim.cmd("LspZeroFormat")
		vim.cmd("write")
	end
end

vim.api.nvim_create_autocmd({ "InsertLeave" }, {
	callback = AutoSaveNFormat,
	pattern = "*.*",
	group = group,
})
