M = {}

M.registers = function()
	print("Not implemented")
end

M.find_nvim_configs = function()
	local opts = {
		cwd = vim.g.nvim_dir,
		-- find_files = "rg"
	}
	require("telescope.builtin").find_files(opts)
end

M.all_configs = function()
	local opts = {
		cwd = "/home/tusqasi/",
		-- find_files = "rg",
		search_dirs = {
			"/home/tusqasi/.config/qtile",
			"/home/tusqasi/.config/nvim",
			"/home/tusqasi/.config/zsh",
			-- "/home/tusqasi/.config/fish",
			-- "/home/tusqasi/.config/awesome",
			"/home/tusqasi/script",
		},
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
end

M.flutter_start = function(device)
	if not device then
		-- print "selecting device"
		vim.ui.input({ prompt = "Enter device for flutter: " }, function(input)
			device = input or "linux"
		end)
	end
	Ok, _ = pcall(vim.cmd, string.format("VimuxRunCommand('flutter run -d %s')", device))
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
M.find_config_sys = function()
	local dirs = {
		"~/.config/alacritty",
		"~/.config/nvim",
		"~/.config/tmux/",
		"~/.config/zsh",
		"~/.config/qtile",
		"~/.config/i3",
		"~/scripts",
	}
end

return M
