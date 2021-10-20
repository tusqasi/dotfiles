" letnset.vim
let g:user_emmet_install_global = 0
augroup emmt
    autocmd!
    au BufEnter *.html,*.css,*.js EmmetInstall
augroup END
set mouse=a
let g:coc_global_extensions = [
    \'coc-json',
    \'coc-flutter', 
    \'coc-flutter-tools', 
    \'coc-clangd',
    \'coc-snippets',
    \'coc-prettier',
    \'coc-git',
    \]
" \'coc-jedi',
" \'coc-tsserver',
" \'coc-vimlsp',
" \'coc-rls',
set scrolloff=999
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

set swapfile
set undofile
" Persistent Undo
set undodir=~/.config/nvim/undodir/
" Set swap directory
set directory=~/.config/nvim/swapfiles/

" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
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

