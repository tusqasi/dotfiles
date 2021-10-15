" lightline.vim

set noshowmode

let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }
let g:lightline.active = {
    \ 'left': [ [ 'mode', 'paste' ],
    \           [ 'readonly', 'filename', 'modified' ] ],
    \ 'right': [ [ 'lineinfo' ],
    \            [ 'percent' ],
    \		 [ 'linenum' ],
    \            [ 'filetype' ] ] 
    \}
    "\            [ 'fileformat', 'fileencoding', 'filetype' ] ] }

let g:lightline.inactive = {
    \ 'left': [ [ 'filename' ] ],
    \ 'right': [ [ 'lineinfo' ],
    \            [ 'percent' ] ] }
let g:lightline.tabline = {
    \ 'left': [ [ 'tabs' ] ],
    \}


" Light line end
