local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>m", mark.add_file)
vim.keymap.set("n", "<leader>M", ui.toggle_quick_menu)


for i = 1, 6, 1 do
	vim.keymap.set("n", "<leader>" .. i, function() ui.nav_file(i) end)
end
