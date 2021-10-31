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

local disabled_built_ins = {
  "gzip",
  "zip",
  "zipPlugin",
  "tar",
  "tarPlugin",
  "getscript",
  "getscriptPlugin",
  "vimball",
  "vimballPlugin",
  "2html_plugin",
  "logipat",
  "rrhelper",
  "spellfile_plugin",
  "matchit"
}
for _, plugin in pairs(disabled_built_ins) do
  vim.g["loaded_" .. plugin] = 1
end
