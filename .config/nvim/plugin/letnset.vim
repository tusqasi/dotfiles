let g:user_emmet_install_global = 0
let $VIM='~/.config/nvim'

" no netrw_banner 
let g:netrw_banner = 0

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

" don't close exited buffer
set hidden

" Persistent Undo
set undodir=~/.config/nvim/undodir/
set undofile

" Set swap directory
set directory=~/.config/nvim/swapfiles/
" Set backup directory
set backupdir=~/.config/nvim/backupdir/

syntax on

" Settings for search
set incsearch
set hlsearch
set smartcase
set ignorecase
set inccommand=nosplit
"
set updatetime=90
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.gz*

