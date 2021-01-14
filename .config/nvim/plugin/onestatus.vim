" OneStatus 
set hidden
if !empty($TMUX)
    au BufEnter * :OneStatus
    set ls=0
    au ExitPre * :!tmux source ~/onestatus.conf
endif
fun CurFileType()
    return expand('%:e')
endfun
"
