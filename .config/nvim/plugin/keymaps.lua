--[[ " keymaps.vim
-- Does what it says ]]
--
local map = vim.api.nvim_set_keymap

-- map the leader key
local options = {noremap = true}
map("n", "<space>", "<nop>", {noremap = true, silent = true})
vim.g.mapleader = " "

map("n", ";", ":", options)
map("n", ":", ";", options)

vim.g.mapleader = " "
-- make Y behave more like C and D
map("n", "Y", "y$", options)

-- search for open buffers
map("n", "<Leader>b", "<CMD>lua require('functions').buffers()<CR>", options)

-- better search
map("n", "<Leader>/", "<CMD>lua require('functions').buf_search()<CR>", options)

-- registers
map("n", "<Leader>R", "<CMD>lua require('functions').registers()<CR>", options)

-- fd
map("n", "<Leader>F", "<CMD>lua require('functions').fd()<CR>", options)

-- edit nvim
map("n", "<Leader>ne", "<CMD>lua require('functions').nvim_configs()<CR>", options)

-- file broswer
map("n", "<Leader>Fb", "<CMD>lua require('functions').file_browser()<CR>", options)

-- telescope
map("n", "<Leader>;", "<CMD>lua require('telescope.builtin').builtin()<CR>", options)

-- shows references
map("n", "<Leader>rr", "<CMD>lua require('functions').references()<CR>", options)

-- yank whole file
map("n", "<Leader>c", ':norm ggVG"+y<CR>', options)
map("n", "<F2>", ";Vifm<Cr>", options)

-- <Leader> l to save
map("n", "<Leader>l", ":update<CR>", {silent = true, noremap = true})

map("n", "<Leader>o", ":AerialToggle<CR>", {silent = true, noremap = true})

-- Distraction Free
-- map("n", "<F3>", ";Goyo<Cr>", options)

-- "caps = esc
-- au VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
-- au VimLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'

-- Mapping for spell check
map("n", "<F6>", ";setlocal spell! spelllang=en<CR>", options)

-- Diable Help for F1
map("n", "<F1>", "<NOP>", options)

vim.g.user_emmet_leader_key = ","
