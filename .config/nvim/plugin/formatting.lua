-- run formatting stuff on save

-- fomatter from https://github.com/mhartington/formatter.nvim
--
require("formatter").setup(
  {
    filetype = {
      lua = {
        -- luafmt
        function()
          return {
            --[[
           npm i -g lua-fmt
            --]]
            exe = "luafmt",
            args = {"--indent-count", 2, "--stdin"},
            stdin = true
          }
        end
      }
    }
  }
)

vim.api.nvim_exec(
  [[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.lua FormatWrite
  autocmd BufWritePost *.dart,*.java lua vim.lsp.buf.formatting()
augroup END
]],
  true
)
