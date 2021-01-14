" let g:deoplete#enable_at_startup = 1
" let g:deoplete#sources#jedi#python_path='python'
let g:jedi#goto_stubs_command = "<leader>q"
let g:jedi#use_splits_not_buffers = "right"
let g:python_host_prog='python2'
let g:user_emmet_install_global = 0
let $VIM='~/.config/nvim/'


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


set updatetime=100
