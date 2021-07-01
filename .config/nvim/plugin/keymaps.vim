" keymaps.vim
" Does what it says
nnoremap ; :
nnoremap : ;
"
nnoremap <SPACE> <Nop>
let mapleader=" "
" map <Space> <Leader>

"make Y behave more like C and D
nnoremap Y y$

if exists('g:vscode')
    nmap <silent><Leader>l ;call VSCodeCall("workbench.action.files.save")<CR>
elseif has('nvim')
    nnoremap <Leader>b :Buffers<CR>
    nnoremap <Leader>/ :Lines<CR> 
    function! ND_files(query, fullscreen)
      let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
      let initial_command = printf(command_fmt, shellescape(a:query))
      let reload_command = printf(command_fmt, '{q}')
      let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command], 'dir': '/home/tusqasi/.config/nvim/'}
      call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
    endfunction

    command! -nargs=* -bang Neof call ND_files(<q-args>, <bang>0)
    nnoremap <leader>ve :tabedit<CR>:Neof<CR>

    nmap <F2> ;Vifm<Cr>
    "

    " <Leader>S to save and source
    noremap <silent><Leader>S		:w<CR>:source $MYVIMRC<CR>
    "
    " <Leader> l to save
    noremap <silent><Leader>l               :update<CR>

    "visual drag
    vmap  <expr>  <LEFT>   DVB_Drag('left')                         
    vmap  <expr>  <RIGHT>  DVB_Drag('right')                        
    vmap  <expr>  <DOWN>   DVB_Drag('down')                         
    vmap  <expr>  <UP>     DVB_Drag('up')                           
    vmap  <expr>  D        DVB_Duplicate()                          
    "
    " Distraction Free
    nmap <F3> ;Goyo<Cr>



    " Remap for deoplete
    " inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
    "

    "caps = esc
    " au VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
    "au VimLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'

    "

    " <Leader>Q to save and quit
    noremap <silent><Leader><M-q>		:wq<CR>
    "

    " <Leader>P to save, source, and plugInstall 
    noremap <silent><Leader><M-P>		:w<CR>:source $MYVIMRC<CR>:PlugInstall<CR>
    "

    " Mapping for spell check 
    nmap <F6> ;setlocal spell! spelllang=en<CR>


    " Diable Help for F1
    noremap <F1> <NOP>
    "

    " coc configs
    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    inoremap <silent><expr> <TAB>
	  \ pumvisible() ? "\<C-n>" :
	  \ <SID>check_back_space() ? "\<TAB>" :
	  \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
    inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : 
					       \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
    " coc end
    let g:user_emmet_leader_key = ','
endif

