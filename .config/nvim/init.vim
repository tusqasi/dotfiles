call plug#begin('~/.config/nvim/plugged')
if exists('g:vscode')
elseif has('nvim')

    Plug 'narajaon/onestatus'
    Plug 'itchyny/lightline.vim'
    Plug 'vifm/vifm.vim'
    Plug 'itchyny/vim-gitbranch'
    Plug 'dag/vim-fish'
    Plug 'gruvbox-community/gruvbox'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'tpope/vim-surround'
    Plug 'mattn/emmet-vim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
endif
Plug 'tpope/vim-commentary'
Plug 'easymotion/vim-easymotion'
Plug 'wellle/targets.vim'
Plug 'tpope/vim-repeat'
call plug#end()
