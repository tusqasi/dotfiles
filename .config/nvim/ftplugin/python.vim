setlocal shiftwidth=4
setlocal tabstop=4
setlocal expandtab
setlocal softtabstop
let g:python3_host_prog = '/usr/bin/python3'
autocmd FileType python nnoremap <buffer> <CR> :w<CR>:!python %<CR>
autocmd FileType python nnoremap <buffer> <Leader><CR> :w<CR>:!/usr/bin/python3 -m black %<CR>:e!<CR>
lua << EOF
require'lspconfig'.pyright.setup{}
EOF
