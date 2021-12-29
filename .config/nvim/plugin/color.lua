--[[ color.vim
"Colors
 set background=dark
 autocmd VimEnter * hi Normal ctermbg=NONE guibg=NONE
 let g:gruvbox_transperent_bg=1
 colorscheme dracula
 set termguicolors  ]]
vim.api.nvim_command("autocmd VimEnter * hi Normal ctermbg=NONE guibg=NONE")
vim.opt.termguicolors = true
-- vim.opt.background = "dark"
vim.api.nvim_command("colorscheme dracula")
vim.api.nvim_command("set termguicolors")
