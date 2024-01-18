-- Persistent Undo
vim.opt.undofile = true
vim.opt.undodir = vim.env.HOME .. "/.local/share/nvim/undodir/"
-- Make those folders automatically if they don't already exist.
if not vim.fn.isdirectory(vim.o.undodir) then
	vim.fn.mkdir(vim.o.undodir, "p")
end

-- Settings for search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.timeout = false
--vim.opt.timeoutlen = 100

-- Backups and swap and such
vim.opt.swapfile = false

-- Indents
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- Hybrid numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Make the gutter stable, always two columns for gutter
vim.opt.signcolumn = "yes:3"

-- Leader key = space
vim.g.mapleader = ' '

-- IDK, why not?
vim.o.completeopt = "menuone,noselect"

-- Annoying myself
-- vim.o.cursorline = true
-- vim.o.cursorcolumn = true
-- vim.o.colorcolumn  = '80'

-- Folds 
vim.o.foldlevelstart = 99
vim.o.foldenable = false
vim.o.foldmethod="expr"
vim.o.foldexpr= "nvim_treesitter#foldexpr()"

vim.g.user_emmet_leader_key = ','

-- Statusline
vim.g.showmode = false

-- Block Cursor
vim.opt["guicursor"] = ""
