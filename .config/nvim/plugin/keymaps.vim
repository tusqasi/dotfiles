" Does what it says
nnoremap ; :
nnoremap : ;
"
nnoremap <SPACE> <Nop>
let mapleader=" "
" map <Space> <Leader>


if exists('g:vscode')
    nmap <silent><Leader>l ;call VSCodeCall("workbench.action.files.save")<CR>
elseif has('nvim')
    " f2 for vifm
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

    " Map <tab> to trigger completion and navigate to the next item: >
    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~ '\s'
    endfunction

    inoremap <silent><expr> <TAB>
		  \ pumvisible() ? "\<C-n>" :
		  \ <SID>check_back_space() ? "\<TAB>" :
		  \ coc#refresh()

    " <CR> to confirm completion, use: >
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"

    inoremap <silent><expr> <S-TAB>
		  \ pumvisible() ? "\<C-p>" :
		  \ <SID>check_back_space() ? "\<TAB>" :
		  \ coc#refresh()
    " Use <C-l> for trigger snippet expand.
    imap <C-l> <Plug>(coc-snippets-expand)
    
    " Use <C-j> for select text for visual placeholder of snippet.
    vmap <C-j> <Plug>(coc-snippets-select)
    
    " Use <C-j> for jump to next placeholder, it's default of coc.nvim
    let g:coc_snippet_next = '<c-j>'
    
    " Use <C-k> for jump to previous placeholder, it's default of coc.nvim
    let g:coc_snippet_prev = '<c-k>'
    
    " Use <C-j> for both expand and jump (make expand higher priority.)
    imap <C-j> <Plug>(coc-snippets-expand-jump)
    
    " Use <leader>x for convert visual selected code to snippet
    xmap <leader>x  <Plug>(coc-convert-snippet)
    endif
