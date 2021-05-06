let g:user_emmet_install_global = 0

" no netrw_banner 
let g:netrw_banner = 0

" Enable folding

set foldmethod=indent
set foldlevel=99
" Numberline settings
" Hybrid numbers
set number relativenumber
" set nu 

" Encoding
set encoding=utf-8
" Tab to 4
set softtabstop=4
set shiftwidth=4

set nocompatible              " required
filetype off                  " required

" don't close exited buffer
set hidden
" Backups and swap and such

set backup
set swapfile
set undofile
" Persistent Undo
set undodir=~/.config/nvim/undodir/
" Set swap directory
set directory=~/.config/nvim/swapfiles/
" Set backup directory
set backupdir=~/.config/nvim/backupdir/

" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif
syntax on

" Settings for search
set incsearch
set hlsearch
set smartcase
set ignorecase
set inccommand=nosplit
"
set updatetime=80
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.gz*

" Easy motion
"
