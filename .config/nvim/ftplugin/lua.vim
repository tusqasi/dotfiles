setlocal shiftwidth=2
setlocal tabstop=2
setlocal expandtab
setlocal softtabstop
augroup lua_file
  autocmd!
  au BufWrite *.lua :lua vim.lsp.buf.formatting()
augroup END
