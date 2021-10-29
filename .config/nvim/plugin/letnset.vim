" letnset.vim
" turn off emmet by default
let g:user_emmet_install_global = 0
" turn on emmet for html, css, js
augroup emmet
    autocmd!
    au BufEnter *.html,*.css,*.js EmmetInstall
augroup END

" turn of default keybindings
let g:tmux_navigator_no_mappings = 1

" vim-tmux-navigator keybindings
nnoremap <silent> <C-H> :TmuxNavigateLeft<cr>
nnoremap <silent> <NL>  :TmuxNavigateDown<cr>
nnoremap <silent> <C-K> :TmuxNavigateUp<cr>
nnoremap <silent> <C-L> :TmuxNavigateRight<cr>


" let g:coc_global_extensions = [
"     \'coc-clangd',
"     \'coc-snippets',
"     \'coc-prettier',
"     \'coc-git',
"     \]
" \'coc-json',
" \'coc-flutter', 
" \'coc-flutter-tools', 
" \'coc-jedi',
" \'coc-tsserver',
" \'coc-vimlsp',
" \'coc-rls',

" no netrw_banner 
let g:netrw_banner = 0

" Enable folding
set foldmethod=indent
set foldlevel=99

" Numberline settings
" Hybrid numbers
set number relativenumber
" set nu 
set signcolumn=yes:2

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
set nohlsearch
set smartcase
set ignorecase
set inccommand=nosplit
"
set updatetime=20
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.gz*
