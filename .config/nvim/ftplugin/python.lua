-- vim.bo.shiftwidth=4
-- vim.bo.tabstop=4
-- vim.bo.expandtab =Tr
-- vim.bo.softtabstop
-- vim.g.python3_host_prog = '/usr/bin/python3'

vim.cmd([[
nnoremap <buffer> <CR> :w<CR>:!python3 %<CR>
nnoremap <buffer> <Leader><CR> :w<CR>:!/usr/bin/python3 -m black %<CR>:e!<CR>
]])
