" init.vim
let g:plugin_home=expand(stdpath('data') . '/plugged')
function PlugUse()
    call plug#begin(g:plugin_home)
    if exists('g:vscode')
    elseif has('nvim')

	" Plug 'narajaon/onestatus'
	Plug 'itchyny/lightline.vim'
	Plug 'vifm/vifm.vim'
	Plug 'itchyny/vim-gitbranch'
	Plug 'dag/vim-fish'
	Plug 'gruvbox-community/gruvbox'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'mattn/emmet-vim'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'christoomey/vim-tmux-navigator'
	Plug 'MaxMEllon/vim-jsx-pretty'
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
	Plug 'neovim/nvim-lspconfig'
	Plug 'williamboman/nvim-lsp-installer'

	"Dart/Flutter
	Plug 'dart-lang/dart-vim-plugin'
	Plug 'thosakwe/vim-flutter'
	Plug 'natebosch/vim-lsc'
	Plug 'natebosch/vim-lsc-dart'
    endif
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'
    Plug 'easymotion/vim-easymotion'
    Plug 'wellle/targets.vim'
    Plug 'tpope/vim-repeat'
    call plug#end()
endfunction

call PlugUse()
