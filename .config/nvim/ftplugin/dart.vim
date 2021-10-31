let g:flutter_running=0
function Flutter_dev()
    if !g:flutter_running
	:CocCommand flutter.run
	let g:flutter_running=1
    endif
endfunction
" autocmd FileType dart nnoremap <buffer> <CR> :call Flutter_dev()<CR>
" autocmd FileType dart nnoremap <buffer> <Leader><CR> :DartFmt<CR>

let flutter_hot_reload_on_save=1
let flutter_hot_reload_on_save=1

set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set softtabstop
