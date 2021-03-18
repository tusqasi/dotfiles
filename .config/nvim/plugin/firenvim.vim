function! s:IsFirenvimActive(event) abort
  if !exists('*nvim_get_chan_info')
    return 0
  endif
  let l:ui = nvim_get_chan_info(a:event.chan)
  return has_key(l:ui, 'client') && has_key(l:ui.client, 'name') &&
      \ l:ui.client.name =~? 'Firenvim'
endfunction

function! OnUIEnter(event) abort
  if s:IsFirenvimActive(a:event)
    set laststatus=0
  endif
endfunction
autocmd UIEnter * call OnUIEnter(deepcopy(v:event))

let g:firenvim_config = {
    \ 'globalSettings': {
        \ 'alt': 'all',
    \  },
    \ 'localSettings': {
        \ '.*': {
            \ 'cmdline': 'neovim',
            \ 'priority': 0,
            \ 'selector': 'textarea',
            \ 'takeover': 'never',
        \ },
    \ }
\ }

let fc = g:firenvim_config['localSettings']
let fc['https?://twitter.com.*'] = { 'takeover': 'always', 'priority': 1 }
let fc['https?://reddit.com.*'] = {'takeover': 'always', 'priority': 1}

augroup FNV
    autocmd!
    au BufEnter github.com_*.txt set filetype=markdown
    au BufEnter stackoverflow_*.txt set filetype=markdown
    au BufEnter www.reddit.com_*.txt set filetype=markdown
augroup END
