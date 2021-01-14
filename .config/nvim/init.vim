" let g:deoplete#enable_at_startup = 1
" let g:deoplete#sources#jedi#python_path='python'
let g:jedi#goto_stubs_command = "<leader>q"
let g:jedi#use_splits_not_buffers = "right"
let g:python_host_prog='python2'
let g:user_emmet_install_global = 0
let $VIM='~/.config/nvim/'

" let g:startify_custom_header = []
" let g:startify_lists = [
"       \ { 'type': 'bookmarks',  'header': ['   Bookmarks']    },
"       \ { 'type': 'files',      'header': ['   MRU']          },
"       \ { 'type': 'sessions',   'header': ['   Sessions']},
"       \]

"Emmet"
autocmd FileType html,css EmmetInstall


"visual drag
" vmap  <expr>  <LEFT>   DVB_Drag('left')                         
" vmap  <expr>  <RIGHT>  DVB_Drag('right')                        
" vmap  <expr>  <DOWN>   DVB_Drag('down')                         
" vmap  <expr>  <UP>     DVB_Drag('up')                           
" vmap  <expr>  D        DVB_Duplicate()                          
"

"Colors
colorscheme rakr
set tgc
"

" let g:startify_bookmarks = [
"     \ {'PY_STUFF': '~/Documents/python_stuff/'},
"     \ {'VIMRC': '~/.config/nvim/init.vim'},
"     \]

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

" Enable folding
set foldmethod=indent
set foldlevel=99
" Hybrid numbers
" set number relativenumber
set nu 
" Encoding
set encoding=utf-8
" Tab to 4
set softtabstop=4
set shiftwidth=4


set nocompatible              " required
filetype off                  " required

" plugins start here

call plug#begin('~/.config/nvim/plugged')

Plug 'junegunn/goyo.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
" Plug 'mhinz/vim-startify'
Plug 'narajaon/onestatus'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'zchee/deoplete-jedi'
Plug 'itchyny/lightline.vim'
Plug 'vifm/vifm.vim'
Plug 'easymotion/vim-easymotion'
Plug 'TaDaa/vimade'
Plug 'tpope/vim-commentary'
Plug 'itchyny/vim-gitbranch'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'dense-analysis/ale'
Plug 'mattn/emmet-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dag/vim-fish'
" xlp
call plug#end()



"  plugins end here

" call deoplete#custom#option('ignore_case', v:true)

" deo autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" Persistent Undo
set undodir=~/.config/nvim/undodir/
set undofile

" Set swap directory
set directory=~/.config/nvim/swapfiles/
" Set backup directory
set backupdir=~/.config/nvim/backupdir/

syntax on
""""""""""
"Light line

set noshowmode

let g:lightline = {
      \ 'colorscheme': 'darcula',
      \ 'active': {
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'filetype'] ] 
      \ }
      \ }



" Light line end


" Settings for search
set incsearch
set hlsearch
set smartcase
set ignorecase
set inccommand=nosplit
"


set updatetime=100


" f2 for vifm
"nmap <F2> ;Vifm<Cr>
""


"" Does what it says
"nnoremap ; :
"nnoremap : ;
""

"" Remap for deoplete
"" inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
""

""caps = esc
"au VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
""au VimLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'
""

""  <Leader>l  to save
"noremap <silent><Leader>l               :update<CR>
""

"" <Leader>Q to save and quit
"noremap <silent><Leader><M-q>		:wq<CR>
""

"" <Leader>Q to quit
"noremap <silent><Leader>Q		:q<CR>
""

"" <Leader>S to save and source
"noremap <silent><Leader>S		:w<CR>:source $MYVIMRC<CR>

""

"" Easymotion Keys
"map <Space> <Leader>
"map <Leader> <Plug>(easymotion-prefix)
"nmap <Leader>s <Plug>(easymotion-overwin-f2)

"map <Leader>j <Plug>(easymotion-j)
"map <Leader>k <Plug>(easymotion-k)
"let g:EasyMotion_smartcase = 1
""

"" Distraction Free
"nmap <F3> ;Goyo<Cr>

"" Mapping for spell check 
"nmap <F6> ;setlocal spell! spelllang=en<CR>

"" swapLine Plugin
"source ~/.config/nvim/autoload/swapLine.vim

"" drag visuals.vim
"source ~/.config/nvim/autoload/dragvisuals.vim

"" Emmet leader key
"let g:user_emmet_leader_key=','
""

"" Diable Help for F1
"noremap <F1> <NOP>
"


" keyboards remaps end
