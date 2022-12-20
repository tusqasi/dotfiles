local AutoSaveNFormatToggle = function()
	if not vim.g.__auto_save_n_format then
		vim.g.__auto_save_n_format = true
	else
		-- now turn off
		vim.g.__auto_save_n_format = false
	end
end
local SourceAndSyncPlugin = function()
	-- Source file
	vim.cmd("source ~/.config/nvim/lua/user/plugins.lua")
	-- plugins install
	require("packer").sync()
	print("Updated packer plugins!")
end
local options = { silent = true }


vim.keymap.set("n", "<Leader>i", SourceAndSyncPlugin, options)

-- Keep things center and nicce while navigating
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Paste the hilighted text to void bufer
vim.keymap.set("x", "<Leader>p", [["_dP]])

-- Paste to system clipboard
vim.keymap.set({ "n", "v" }, "<Leader>y", [["+y]])
vim.keymap.set("n", "<Leader>Y", [["+Y]])

-- Substitute word under cursor
-- Help c^r
-- Help c^w
vim.keymap.set("n", "<Leader><leader>S", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<Leader><leader>s", [[:s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- UndotreeToggle
vim.keymap.set("n", "<Leader>u", "<CMD>UndotreeToggle<CR>")

-- File browser
vim.keymap.set("n", "<Leader>fb", "<CMD>Explore<CR>")

-- Telescope
-- Better search
vim.keymap.set("n", "<Leader>/", "<CMD>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>", {})

-- All builtins
vim.keymap.set("n", "<Leader>;", "<CMD>lua require('telescope.builtin').builtin()<CR>", options)

-- Buffers
vim.keymap.set("n", "<Leader>b", "<CMD>lua require('telescope.builtin').buffers()<CR>", options)


vim.keymap.set("n", "<Leader>o", AutoSaveNFormatToggle, options)
