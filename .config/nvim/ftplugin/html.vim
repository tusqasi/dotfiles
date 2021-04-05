setlocal shiftwidth=2
setlocal tabstop=2
setlocal expandtab
setlocal softtabstop
augroup emt
    au!
    autocmd FileType html,css EmmetInstall
augroup END
