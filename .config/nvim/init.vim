call plug#begin('~/.config/nvim/plugged')
if exists('g:vscode')
elseif has('nvim')

    " Plug 'junegunn/goyo.vim'
    " Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
    if !empty($TMUX)
	Plug 'narajaon/onestatus'
    endif
    " Plug 'zchee/deoplete-jedi'
    " Plug 'Shougo/deoplete.nvim'
    Plug 'itchyny/lightline.vim'
    Plug 'vifm/vifm.vim'
    Plug 'itchyny/vim-gitbranch'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'dag/vim-fish'
    Plug 'gruvbox-community/gruvbox'
    Plug 'jpalardy/vim-slime'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    " telescope
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    " Plug 'hugolgst/vimsence'
    " xlp
    " packadd! dracula
endif
Plug 'tpope/vim-commentary'
Plug 'mattn/emmet-vim'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'wellle/targets.vim'
Plug 'tpope/vim-repeat'
call plug#end()
