call plug#begin('~/.config/nvim/plugged')
if exists('g:vscode')
    echo "VScode"
elseif has('nvim')
    "
    echo "NeoVim"

    " Plug 'junegunn/goyo.vim'
    " Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
    if !empty($TMUX)
	Plug 'narajaon/onestatus'
    endif
    " Plug 'zchee/deoplete-jedi'
    " Plug 'Shougo/deoplete.nvim'
    Plug 'itchyny/lightline.vim'
    Plug 'vifm/vifm.vim'
    " Plug 'TaDaa/vimade'
    Plug 'itchyny/vim-gitbranch'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'dag/vim-fish'
    Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
    Plug 'gruvbox-community/gruvbox'
    Plug 'jpalardy/vim-slime'
    " Plug 'hugolgst/vimsence'
    " xlp
    " packadd! dracula
endif
Plug 'tpope/vim-commentary'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
call plug#end()
