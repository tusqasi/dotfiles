vim.cmd(
    [[
nnoremap <buffer> <CR> :w<CR>:!python3 %<CR>
nnoremap <buffer> <Leader><CR> :w<CR>:!/usr/bin/python3 -m black %<CR>:e!<CR>
]]
)
