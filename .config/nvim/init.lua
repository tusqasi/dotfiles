vim.g.nvim_dir = vim.fn.expand("~") .. "/.config/nvim"
local ok, reload, treesitter, colorizer
ok, reload = pcall(require, "plenary.reload")
RELOAD = ok and reload.reload_module or function(...)
    return ...
  end
function R(name)
  RELOAD(name)
  return require(name)
end
ok, treesitter = pcall(require, "nvim-treesitter.configs")
if ok then
  treesitter.setup({highlight = {enable = true}})
end
ok, colorizer = pcall(require, "colorizer")
if ok then
  vim.opt.termguicolors = true
  colorizer.setup({})
end

require "tusqasi.cmp"
require "tusqasi.comments"
require "tusqasi.disable_builtin"
require "tusqasi.disabled"
require "tusqasi.formatting"
require "tusqasi.lsp"
require "tusqasi.luasnip"
require "tusqasi.snippets"
require "tusqasi.statusline"
require "tusqasi.telescope"
require "tusqasi.text-obj"
require "tusqasi.disabled"
