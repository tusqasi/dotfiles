--[[ " keymaps.vim
-- Does what it says ]]
--
--
local map = vim.api.nvim_set_keymap
local bmap = vim.api.nvim_buf_set_keymap

-- map the leader key
local options = {noremap = true}
vim.g.mapleader = " "
map("n", "<Space>", "<Nop>", {noremap = true, silent = true})

map("n", ";", ":", options)
map("n", ":", ";", options)

-- search for open buffers
map("n", "<Leader>b", "<CMD>lua require('functions').buffers()<CR>", options)

-- better search
map("n", "<Leader>/", "<CMD>lua require('functions').buf_search()<CR>", options)

-- registers
map("n", "<Leader>R", "<CMD>lua require('functions').registers()<CR>", options)

-- fd
map("n", "<Leader>F", "<CMD>lua require('functions').fd()<CR>", options)

-- Edit nvim configs
map("n", "<Leader>ne", "<CMD>lua require('functions').nvim_configs()<CR>", options)

-- grep in  nvim configs and edit
map("n", "<Leader>nE", "<CMD>lua require('functions').grep_nvim_configs()<CR>", options)

-- File broswer
map("n", "<Leader>Fb", "<CMD>lua require('functions').file_browser()<CR>", options)

-- Telescope builtins
map("n", "<Leader>;", ":Telescope builtin<CR>", options)

-- Spell suggestions at cursor
map("n", "<Leader>s", ":Telescope spell_suggest<CR>", options)

-- Show code actions at cursor
map("n", "<Leader>a", ":Telescope lsp_code_actions<CR>", options)

-- Help tags
map("n", "<Leader>h", ":Telescope help_tags<CR>", options)


-- Show references
map("n", "<Leader><Leader>", ":Telescope lsp_references<CR>", options)

-- Yank whole file
map("n", "<Leader>c", ':norm ggVG"+y<CR>', options)
map("n", "<F2>", ";Vifm<Cr>", options)

-- <Leader> l to save
map("n", "<Leader>l", ":update<CR>", {silent = true, noremap = true})

-- Goyo distraction free
map("n", "<F3>", ":Goyo<CR>", options)

-- Mapping for spell check
map("n", "<F6>", "<CMD>setlocal spell! spelllang=en<CR>", options)

-- Disable Help for F1
map("n", "<F1>", "<NOP>", options)

map("n", "<Leader>o", "<CMD>AerialToggle<CR>", options)

map("n", "<leader><leader>sn", "<cmd>luafile ~/.config/nvim/lua/tusqasi/snippets.lua<CR>", options)
map("n", "<leader><leader>sk", "<cmd>luafile ~/.config/nvim/plugin/keymaps.lua<CR>", options)
map("n", "<leader><leader>x", "<cmd>source %<CR>", options)

map("n", "<C-/>", "<Nop>", options)

vim.g.user_emmet_leader_key = ","
