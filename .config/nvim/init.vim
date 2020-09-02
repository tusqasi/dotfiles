let g:deoplete#enable_at_startup = 1
let g:startify_custom_header = []
let g:python_host_prog='/usr/bin/python'

let g:startify_lists = [
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ ]



" Enable folding
set foldmethod=indent
set foldlevel=99

" Hybrid numbers
set number relativenumber
set nu rnu

" Encoding
set encoding=utf-8

" Tab to 4
set softtabstop=4
set shiftwidth=4


set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)
Plugin 'itchyny/lightline.vim'
Plugin 'vifm/vifm.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'dracula/vim', { 'name': 'dracula' }
Plugin 'easymotion/vim-easymotion'
Plugin 'ycm-core/YouCompleteMe'
"Xpl
" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required



call plug#begin('~/.vim/plugged')
Plug 'junegunn/goyo.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
"Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'mhinz/vim-startify'
Plug 'mbbill/undotree'
"xpl
call plug#end()

" Persistent Undo

set undodir=$HOME"/.undodir"
set undofile


syntax on
""""""""""
"Light line

set noshowmode

let g:lightline = {
      \ 'colorscheme': 'darcula',
      \ 'active': {
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'filetype'] ] 
      \ }
      \ }



""""""""""
call deoplete#custom#option('ignore_case', v:true)

set incsearch
set hlsearch


"inoremap [ []
"inoremap { {}
"inoremap < <>
"inoremap ( ()
"inoremap ' ''
"inoremap " ""
"

" f2 for vifm
nmap <F2> ;Vifm<Cr>
"


" Does what it says
nnoremap ; :
nnoremap : ;
"

" Remap for deoplete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
"

"caps = esc
au VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
"au VimLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'
"

" <ctrl s>  to save
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>
"

" Easymotion Keys
map <Space> <Leader>
map <Leader> <Plug>(easymotion-prefix)
nmap <Leader>s <Plug>(easymotion-overwin-f2)

map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
let g:EasyMotion_smartcase = 1
"

" Distraction Free
nmap <F3> ;Goyo<Cr>

" MarkDown key
nmap <F4> ;MarkdownPreview<Cr>

" Undotree key
nmap <F5> ;UndotreeToggle<cr>

" Automatically closing braces
inoremap {<CR> {<CR>}<Esc>ko<tab>
inoremap [<CR> [<CR>]<Esc>ko<tab>
inoremap (<CR> (<CR>)<Esc>ko<tab>
" Keyboards remaps

""""""""""swapline""""""""""
function! s:swap_lines(n1, n2)
    let line1 = getline(a:n1)
    let line2 = getline(a:n2)
    call setline(a:n1, line2)
    call setline(a:n2, line1)
endfunction

function! s:swap_up()
    let n = line('.')
    if n == 1
        return
    endif

    call s:swap_lines(n, n - 1)
    exec n - 1
endfunction

function! s:swap_down()
    let n = line('.')
    if n == line('$')
        return
    endif

    call s:swap_lines(n, n + 1)
    exec n + 1
endfunction

noremap <silent> <c-s-up> :call <SID>swap_up()<CR>
noremap <silent> <c-s-down> :call <SID>swap_down()<CR>
""""""""""swapline""""""""""
