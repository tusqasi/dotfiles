if exists('g:vscode')
    nmap <Leader><CR> ;call VSCodeCall("editor.action.formatDocument")<CR>
    nmap <CR> ;call VSCodeCall("python.execInTerminal")<CR>

else
    setlocal shiftwidth=4
    setlocal tabstop=4
    setlocal expandtab
    setlocal softtabstop
    let g:python3_host_prog = '/usr/bin/python3.9'
    let g:jedi#auto_initialization = 1
endif
