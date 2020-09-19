let g:deoplete#enable_at_startup = 1
let g:startify_custom_header = []
let g:python_host_prog='/usr/bin/python'
let g:jedi#use_splits_not_buffers = "right"

let g:startify_lists = [
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ ]

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

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

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
Plugin 'tpope/vim-fugitive'
Plugin 'TaDaa/vimade'
"Xpl
" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required



call plug#begin('~/.vim/plugged')
" All PLUGins 
" markdown
Plug 'junegunn/goyo.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
"Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
" Vim Bling
Plug 'mhinz/vim-startify'
" Utilises
Plug 'mbbill/undotree'
" Python things
Plug 'zchee/deoplete-jedi'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'davidhalter/jedi-vim'
"xpl
call plug#end()

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif


" Persistent Undo

set undodir="$HOME/.undodir"
set undofile

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
call deoplete#custom#option('ignore_case', v:true)

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
" Keyboards remaps

" swapLine Plugin
source ~/.vim/autoload/swapLine.vim

