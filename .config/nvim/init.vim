let g:deoplete#enable_at_startup = 1
let g:startify_custom_header = []
let g:python_host_prog='/usr/bin/python3'
let g:deoplete#sources#jedi#python_path='/usr/bin/python3'
let g:jedi#use_splits_not_buffers = "right"
let g:startify_lists = [
      \ { 'type': 'bookmarks',  'header': ['   Bookmarks']    },
      \ { 'type': 'files',      'header': ['   MRU']          },
      \ ]

colorscheme rakr
let g:startify_bookmarks = [
    \ {'PY_STUFF': '~/Documents/python_stuff/'},
    \ {'VIMRC': '~/.config/nvim/init.vim'},
    \]

set hidden
if !empty($TMUX)
    au BufEnter * :OneStatus
    set ls=0
    au ExitPre * :!tmux source ~/onestatus.conf
endif

set rtp+=~/.fzf

" Enable folding
set foldmethod=indent
set foldlevel=99

" Hybrid numbers
set number relativenumber
set nu rnu

" Encoding
set encoding=utf-8

" Tab to 4
set softtabstop=4
set shiftwidth=4

set nocompatible              " required
filetype off                  " required

" plugins start here

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/Bundle')

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
" Main Vundle Plugin
Plugin 'gmarik/Vundle.vim'
" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" Vim Bling
Plugin 'itchyny/lightline.vim'
Plugin 'dracula/vim', { 'name': 'dracula' }
" Utilises
Plugin 'vifm/vifm.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'TaDaa/vimade'
Plugin 'tpope/vim-commentary'
Plugin 'itchyny/vim-gitbranch'
"Xlp
" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required



call plug#begin('~/.config/nvim/plugged')
" All PLUGins 
" markdown
Plug 'junegunn/goyo.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
"Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
" Vim Bling
Plug 'mhinz/vim-startify'
Plug 'narajaon/onestatus'
" Utilises
" Plug 'mbbill/undotree'
" Python things
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'davidhalter/jedi-vim'
Plug 'zchee/deoplete-jedi'
""
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"xlp
call plug#end()


" plugins end here

call deoplete#custom#option('ignore_case', v:true)

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

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



""""""""""

" Settings for search
set incsearch
set hlsearch
set smartcase
set ignorecase
set inccommand=nosplit

inoremap [ []
inoremap { {}
inoremap < <>
inoremap ( ()
inoremap ' ''
inoremap " ""
"

" f2 for vifm
nmap <F2> ;Vifm<Cr>
"


" Does what it says
nnoremap ; :
nnoremap : ;
"

" Remap for deoplete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
"

"caps = esc
au VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
"au VimLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'
"

" <ctrl s>  to save
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>
"

" Easymotion Keys
map <Space> <Leader>
map <Leader> <Plug>(easymotion-prefix)
nmap <Leader>s <Plug>(easymotion-overwin-f2)

map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
let g:EasyMotion_smartcase = 1
"

" Distraction Free
nmap <F3> ;Goyo<Cr>

" MarkDown key
nmap <F4> ;MarkdownPreview<Cr>

" Undotree key
nmap <F5> ;UndotreeToggle<cr>

" Automatically closing braces
inoremap {<CR> {<CR>}<Esc>ko<tab>
inoremap [<CR> [<CR>]<Esc>ko<tab>
inoremap (<CR> (<CR>)<Esc>ko<tab>

" Mapping for spell check 
nmap <F6> ;setlocal spell! spelllang=en<CR>

" swapLine Plugin
source ~/.config/nvim/autoload/swapLine.vim

" Keyboards remaps

