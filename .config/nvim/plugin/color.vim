if has('nvim')
    if exists('g:vscode')
	
    else
	"Colors
	set background=dark
	autocmd VimEnter * hi Normal ctermbg=NONE guibg=NONE
	let g:gruvbox_transperent_bg=0
	colorscheme gruvbox
	set termguicolors 
    endif
endif
