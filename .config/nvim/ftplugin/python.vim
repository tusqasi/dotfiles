if exists('g:vscode')
    echo "vsc"
else
    nnoremap <CR> :w<CR>:!python %<CR>
    setlocal shiftwidth=4
    setlocal tabstop=4
    setlocal expandtab
    setlocal softtabstop
    let g:jedi#auto_initialization = 0
endif
