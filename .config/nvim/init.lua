vim.g.nvim_dir = vim.fn.expand("~") .. "/.config/nvim"

Ok, Treesitter = pcall(require, "nvim-treesitter.configs")
if Ok then
	Treesitter.setup({ highlight = { enable = true } })
end

require("impatient")
require("tusqasi.disable_builtin")
require("tusqasi.globals")
require("tusqasi.cmp")
require("tusqasi.comments")
require("tusqasi.emmet")
require("tusqasi.formatting")
require("tusqasi.formatting")
require("tusqasi.lsp")
require("tusqasi.luasnip")
require("tusqasi.snippets")
require("tusqasi.statusline")
require("tusqasi.telescope")
require("tusqasi.text-obj")
require("tusqasi.treesitter")
