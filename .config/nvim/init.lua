vim.g.nvim_dir = vim.fn.expand("~") .. "/.config/nvim"

-- vim.g.copilot_enabled = false

Ok, Treesitter = pcall(require, "nvim-treesitter.configs")
if Ok then
    Treesitter.setup({highlight = {enable = true}})
end
-- Ok, Colorizer = pcall(require, "colorizer")
-- if Ok then
--     vim.opt.termguicolors = true
--     Colorizer.setup({})
-- end
require("impatient")
require "tusqasi.cmp"
require "tusqasi.comments"
-- require "tusqasi.disable_builtin"
require "tusqasi.formatting"
-- require "tusqasi.globals"
-- require "tusqasi.goyo"
require "tusqasi.lsp"
require "tusqasi.luasnip"
require "tusqasi.snippets"
-- require "tusqasi.statusline"
require "tusqasi.telescope"
require "tusqasi.text-obj"
