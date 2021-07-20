" onestatus.vim
if has("nvim")
if !empty($TMUX)
    augroup onestatus
	au!
	" au BufEnter,VimEnter * :OneStatus
	" au VimLeave * :OneStatusClean
    augroup END
endif
fun CurFileType()
    return expand('%:e')
endfun
endif
