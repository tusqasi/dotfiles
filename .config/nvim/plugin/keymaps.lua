--[[ " keymaps.vim
-- Does what it says ]]
--
--

-- map the leader key
local options = { noremap = true }
vim.g.mapleader = " "
vim.keymap.set("n", "<Space>", "<Nop>", { noremap = true, silent = true })

-- vim.keymap.set("n", ";", ":", options)
-- vim.keymap.set("n", ":", ";", options)

-- search for open buffers
vim.keymap.set("n", "<Leader>b", "<CMD>lua require('telescope.builtin').buffers()<CR>", options)

-- better search
vim.keymap.set("n", "<Leader>/", "<CMD>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>", options)

-- registers
vim.keymap.set("n", "<Leader>R", "<CMD>lua require('functions').registers()<CR>", options)

-- fd
vim.keymap.set("n", "<Leader>ff", "<CMD>lua require('telescope.builtin').git_files()<CR>", options)

-- File broswer
vim.keymap.set("n", "<Leader>fb", "<CMD>lua require('telescope').extensions.file_browser.file_browser()<CR>", options)

-- Telescope builtins
vim.keymap.set("n", "<Leader>;", "<CMD>lua require('telescope.builtin').builtin()<CR>", options)

-- Spell suggestions at cursor
vim.keymap.set("n", "<Leader>S", "<CMD>lua require('telescope.builtin').spell_suggest()<CR>", options)

-- Show code actions at cursor
vim.keymap.set("n", "<Leader>a", "<CMD>lua vim.lsp.buf.code_action()<CR>", options)

-- Help tags
vim.keymap.set("n", "<Leader>h", "<CMD>lua require('telescope.builtin'). help_tags()<CR>", options)

-- Show references
vim.keymap.set("n", "<Leader><Leader>r", "<CMD>lua require('telescope.builtin'). lsp_references()<CR>", options)

-- Edit configs
-- nvim file search
vim.keymap.set("n", "<Leader>ne", "<CMD>lua require('functions').find_nvim_configs()<CR>", options)
-- nvim grep file
vim.keymap.set("n", "<Leader>nE", "<CMD>lua require('functions').find_in_nvim_configs()<CR>", options)
-- all others file search
vim.keymap.set("n", "<Leader>nr", "<CMD>lua require('functions').all_configs()<CR>", options)

-- Yank whole file
vim.keymap.set("n", "<Leader>c", ':norm ggVG"+y<CR>', options)
-- vim.keymap.set("n", "<F2>", ";Vifm<CR>", options)

-- <Leader> l to save
-- vim.keymap.set("n", "<Leader>l", ":update<CR>", { silent = true, noremap = true })

-- Goyo distraction free
-- vim.keymap.set("n", "<F3>", ":Goyo<CR>", options)

-- Mapping for spell check
vim.keymap.set("n", "<F6>", "<CMD>setlocal spell! spelllang=en<CR>", options)

-- Disable Help for F1
vim.keymap.set("n", "<F1>", "<NOP>", options)

vim.keymap.set("n", "<leader><leader>ss", "<CMD> lua require('tusqasi.snippets')<CR>", options)
vim.keymap.set("n", "<leader><leader>sk", "<CMD>luafile ~/.config/nvim/plugin/keymaps.lua<CR>", options)
vim.keymap.set("n", "<leader><leader>x", "<CMD>source %<CR>", options)
vim.keymap.set("n", "<leader><leader>i", "<CMD>lua require('functions').packer_sync()<CR>", options)

vim.keymap.set("n", "<C-/>", "<Nop>", options)

vim.keymap.set("n", "<leader>d", "<CMD>ToggleDiag<CR>", options)
vim.keymap.set("n", "<leader>gg", "<CMD>Neogit<CR>>", options)

-- quickfix list keys
vim.keymap.set("n", "<leader>j", "<CMD>cnext<CR>>", options)
vim.keymap.set("n", "<leader>k", "<CMD>cprev<CR>>", options)
