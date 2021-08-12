if exists('g:vscode')
    nmap <Leader><CR> ;call VSCodeCall("editor.action.formatDocument")<CR>
    nmap <CR> ;call VSCodeCall("python.execInTerminal")<CR>

else
    setlocal shiftwidth=4
    setlocal tabstop=4
    setlocal expandtab
    setlocal softtabstop
    autocmd FileType python nnoremap <buffer> <CR> :w<CR>:!python %<CR>
    autocmd FileType python nnoremap <buffer> <Leader><CR> :w<CR>:!black %<CR>:e!<CR>
    let g:python3_host_prog = '/usr/bin/python'
    let g:python_host_prog = '/usr/bin/python'
endif
