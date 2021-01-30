let g:ctrlp_map = ''
let g:ctrlp_cmd = 'CtrlP'

if executable("rg")
    " set grepprg=rg\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
endif

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/.tmp/*,*/.sass-cache/*,*/node_modules/*,*.keep,*.DS_Store,*/.git/*

let g:ctrlp_extensions = ['bookmarkdir', 'buffertag', 'dir', 'buffer', 'tag']
