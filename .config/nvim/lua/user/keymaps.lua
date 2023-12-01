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

local find_nvim_configs = function()
	local opts = {
		cwd = "/home/tusqasi/.config/nvim/",
		find_files = "rg",
		search_dirs = { "/home/tusqasi/.config/nvim/" },
	}
	require("telescope.builtin").find_files(opts)
end
local options = { silent = true }

vim.keymap.set("n", "<Leader><Leader>i", SourceAndSyncPlugin, options)
vim.keymap.set("n", "<Space>", "<Nop>", { noremap = true, silent = true })


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
vim.keymap.set("n", "<Leader><leader>S", [[:%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<Leader><leader>s", [[:s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>]])

-- UndotreeToggle
vim.keymap.set("n", "<Leader>u", "<CMD>UndotreeToggle<CR>")

-- File browser
vim.keymap.set("n", "<Leader>fb", "<CMD>Explore<CR>")

-- Telescope
-- Better search
local function better_search()
	--[[ print('sdfs') ]]
	require('telescope.builtin').live_grep({})

end
vim.keymap.set("n", "<Leader>/", better_search, {})

-- All builtins
vim.keymap.set("n", "<Leader>;", "<CMD>lua require('telescope.builtin').builtin()<CR>", options)

-- Buffers
vim.keymap.set("n", "<Leader>b", "<CMD>lua require('telescope.builtin').buffers()<CR>", options)

-- Fuzzy file find
vim.keymap.set("n", "<Leader>ff", "<CMD>lua require('telescope.builtin').find_files()<CR>", options)

-- git find
vim.keymap.set("n", "<Leader>gg", "<CMD>lua require('telescope.builtin').git_files()<CR>", options)

-- git find
vim.keymap.set("n", "<Leader>G", "<CMD>lua require('neogit').open()<CR>", options)

-- Find in nvim configs
vim.keymap.set("n", "<Leader><Leader>ne", find_nvim_configs, options)

-- Copy whole file
vim.keymap.set("n", "<Leader>c", [[:norm ggVG"+y<CR>zz]], options)

vim.keymap.set("n", "<Leader>o", AutoSaveNFormatToggle, options)

-- Telescope document symbols
vim.keymap.set("n", "<Leader>s", "<CMD>Telescope lsp_document_symbols<CR>", options)

-- Telescope help
vim.keymap.set("n", "<Leader><Leader>h", "<CMD>Telescope help_tags<CR>", options)

-- Telescope resume
vim.keymap.set("n", "<Leader><Leader><Leader>", "<CMD>Telescope resume<CR>", options)

-- Harpoon
vim.keymap.set("n", "<leader>m", "<CMD>lua require('harpoon.mark').add_file()<CR>", options)
vim.keymap.set("n", "<leader>M", "<CMD>lua require('harpoon.ui').toggle_quick_menu()<CR>", options)

for i = 1, 9, 1 do
	vim.keymap.set(
		"n", "<leader>" .. i,
		string.format("<CMD>lua require('harpoon.ui').nav_file(%s)<CR>", i),
		options)
end

-- Git worktree
vim.keymap.set("n", "<leader>gw", "<CMD>lua  require('telescope').extensions.git_worktree.git_worktrees()<CR>", options)
vim.keymap.set("n", "<leader>gc", "<CMD>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>",
	options)


-- Aerial outliner
-- vim.keymap.set("n", "<leader><leader>o", ":AerialToggle<CR>", options)

-- Git worktree
vim.keymap.set("n", "<leader>z", "<CMD>:ZenMode<CR>" ,options)
