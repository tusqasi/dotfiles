M = {}

M.find_nvim_configs = function()
	local opts = {
		cwd = vim.g.nvim_dir,
		find_files = "rg"
	}
	require("telescope.builtin").find_files(opts)
end

M.find_in_nvim_configs = function()
	local opts = {
		cwd = vim.g.nvim_dir,
		find_files = "rg",
		search_dirs = { vim.g.nvim_dir },
	}
	require("telescope.builtin").live_grep(opts)
end

M.packer_sync = function()
	print("Sourcing nvim/plugin/plugins.lua")
	vim.cmd("source " .. vim.g.nvim_dir .. "/plugin/plugins.lua")
	require("packer").sync()
	require("notify")("Updating plugins")
end

M.filetype_icon = function()
	local filetype = vim.bo.filetype
	if filetype == "" then
		return ""
	end
	local filename, fileext = vim.fn.expand("%:t"), vim.fn.expand("%:e")
	local icon = require("nvim-web-devicons").get_icon(filename, fileext, { default = true })
	return string.format("%s", icon)
end

M.all_configs = function()
	local opts = {
		search_dirs = {
			"/home/tusqasi/script/",
			"/home/tusqasi/.config/qtile",
			"/home/tusqasi/.config/nvim/",
			"/home/tusqasi/.config/zsh/",
			"/home/tusqasi/.config/i3/",
		},
	}
	require("telescope.builtin").find_files(opts)
end

return M
