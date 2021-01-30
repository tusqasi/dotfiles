"visual drag
vmap  <expr>  <LEFT>   DVB_Drag('left')                         
vmap  <expr>  <RIGHT>  DVB_Drag('right')                        
vmap  <expr>  <DOWN>   DVB_Drag('down')                         
vmap  <expr>  <UP>     DVB_Drag('up')                           
vmap  <expr>  D        DVB_Duplicate()                          
"

" f2 for vifm
nmap <F2> ;Vifm<Cr>
"


" Does what it says
nnoremap ; :
nnoremap : ;
"

" Remap for deoplete
" inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
"

"caps = esc
" au VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
"au VimLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'
"

"  <Leader>l  to save
noremap <silent><Leader>l               :update<CR>
"

" <Leader>Q to save and quit
noremap <silent><Leader><M-q>		:wq<CR>
"

" <Leader>S to save and source
noremap <silent><Leader>S		:w<CR>:source $MYVIMRC<CR>
"

" Easymotion Keys
map <Space> <Leader>
map <Leader> <Plug>(easymotion-prefix)
nmap <Leader>s <Plug>(easymotion-overwin-f2)
let g:EasyMotion_smartcase = 1
"
" Distraction Free
nmap <F3> ;Goyo<Cr>

" Mapping for spell check 
nmap <F6> ;setlocal spell! spelllang=en<CR>

" Emmet leader key
let g:user_emmet_leader_key=','
"

" Diable Help for F1
noremap <F1> <NOP>
"

" Ctrlp
nnoremap <leader>p :CtrlP 


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
