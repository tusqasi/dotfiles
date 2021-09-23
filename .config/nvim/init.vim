" init.vim
call plug#begin('~/.config/nvim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'vifm/vifm.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'dag/vim-fish'
Plug 'gruvbox-community/gruvbox'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-commentary'
Plug 'easymotion/vim-easymotion'
Plug 'wellle/targets.vim'
Plug 'tpope/vim-repeat'
call plug#end()
