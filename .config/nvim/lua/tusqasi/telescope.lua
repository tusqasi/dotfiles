local telescope = require("telescope").setup(
	{
		pickers = {
			current_buffer_fuzzy_find = {
				theme = "ivy"
			},
			live_grep = {
				theme = "ivy"
			},
			find_files = {
				theme = "ivy"
			},
			registers = {
				theme = "ivy"
			}
		}
	}
)
