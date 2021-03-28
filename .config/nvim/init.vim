call plug#begin('~/.config/nvim/plugged')
" Plug 'junegunn/goyo.vim'
" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'narajaon/onestatus'
" Plug 'zchee/deoplete-jedi'
" Plug 'Shougo/deoplete.nvim'
Plug 'itchyny/lightline.vim'
Plug 'vifm/vifm.vim'
" Plug 'TaDaa/vimade'
Plug 'tpope/vim-commentary'
Plug 'itchyny/vim-gitbranch'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dag/vim-fish'
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'gruvbox-community/gruvbox'
Plug 'jpalardy/vim-slime'
" Plug 'hugolgst/vimsence'
" xlp
call plug#end()
" packadd! dracula

if exists('g:vscode')
    source ~/.config/nvim/plugin/keymaps.vim
endif
