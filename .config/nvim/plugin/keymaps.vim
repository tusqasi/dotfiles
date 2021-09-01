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

" search for open buffers
nnoremap <Leader>b :Buffers<CR>

" better search
nnoremap <Leader>/ :Lines<CR> 

noremap <Leader>c :norm ggVG"+y<CR>
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

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Make autocomplete work with tab
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

