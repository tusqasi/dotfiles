" lightline.vim

set noshowmode

let g:lightline = {
      \ 'colorscheme': 'default',
      \ }
let g:lightline.active = {
    \ 'left': [ [ 'mode', 'paste' ],
    \           [ 'readonly', 'filename', 'modified' ] ],
    \ 'right': [ [ 'lineinfo' ],
    \            [ 'percent' ], 
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
