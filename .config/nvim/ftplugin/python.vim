setlocal shiftwidth=4
setlocal tabstop=4
setlocal expandtab
setlocal softtabstop
let g:python3_host_prog = '/usr/bin/python3.9'
autocmd FileType python nnoremap <buffer> <CR> :w<CR>:!python3 %<CR>
