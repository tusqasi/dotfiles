local lines_in_file = function()
	local file = vim.fn.expand("%:p")
	if file == nil or #file == 0 then
		return ""
	end
	-- P(#vim.fn.getbufline(file,0,"$"))
	return #vim.fn.getbufline(file, 0, "$")
end

local file_path = function()
	path = vim.fn.expand("%:p")
	-- that 20 is to buffer for the extra chars in the statusline
	padding = 20
	if vim.fn.winwidth(0) < #path + padding then
		return vim.fn.pathshorten(path)
	else
		return path
	end
end

file_path()

require "lualine".setup {
	sections = {
		lualine_a = { "mode" },
		lualine_b = {
			"branch",
			"diff",
			{ "diagnostics", sources = { "nvim_diagnostic" } }
		},
		lualine_c = {
			require "functions".filetype_icon,
			{ "filename", path = 3 }
		},
		lualine_x = {
			"encoding",
			"fileformat",
			{
				"filetype",
				colored = true,
				icon_only = false,
				icon = { align = "right" }
			}
		},
		lualine_y = { "progress" },
		lualine_z = { "location", lines_in_file }
	}
}
