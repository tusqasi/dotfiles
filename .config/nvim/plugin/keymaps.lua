--[[ " keymaps.vim
-- Does what it says ]]
--
local map = vim.api.nvim_set_keymap

-- map the leader key
local options = {noremap = true}
map("n", "<Space>", "", options)
vim.g.mapleader = " "

map("n", ";", ":", options)
map("n", ":", ";", options)

map("n", "<SPACE>", " <Nop>", options)
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

-- file broswer
map("n", "<Leader>Ff", "<CMD>lua require('functions').file_browser()<CR>", options)
-- yank whole file
map("n", "<Leader>c", ':norm ggVG"+y<CR>', options)
map("n", "<F2>", ";Vifm<Cr>", options)

-- <Leader> l to save
map("n", "<Leader>l", ":update<CR>", {silent = true, noremap = true})

-- "visual drag
map("v", "<LEFT>", "DVB_Drag('left')", {expr = true})
map("v", "<RIGHT>", "DVB_Drag('right')", {expr = true})
map("v", "<DOWN>", "DVB_Drag('down')", {expr = true})
map("v", "<UP>", "DVB_Drag('up')", {expr = true})
map("v", "D", "DVB_Duplicate()", {expr = true})
-- Distraction Free
map("n", "<F3>", ";Goyo<Cr>", options)

-- "caps = esc
-- au VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
-- au VimLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'

-- Mapping for spell check
map("n", "<F6>", ";setlocal spell! spelllang=en<CR>", options)

-- Diable Help for F1
map("n", "<F1>", "<NOP>", options)

vim.g.user_emmet_leader_key = ","
