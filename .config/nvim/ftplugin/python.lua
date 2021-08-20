local b = vim.b

b.shiftwidth=4
b.tabstop=4
b.expandtab = true
b.softtabstop= true
vim.cmd([[echo "sf"]])
vim.cmd([[autocmd FileType python nnoremap <buffer> <CR> :w<CR>:!python %<CR>]])
vim.cmd([[autocmd FileType python nnoremap <buffer> <Leader><CR> :w<CR>:!black %<CR>:e!<CR>]])
-- " let g:python3_host_prog = '/usr/bin/python'
-- " let g:python_host_prog = '/usr/bin/python2'
