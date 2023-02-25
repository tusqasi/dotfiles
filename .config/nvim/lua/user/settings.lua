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

-- Make the gutter stable
vim.opt.signcolumn = "yes:2"

-- Leader key
vim.g.mapleader = ' '

-- IDK
vim.o.completeopt = "menuone,noselect"

-- Annoying myself
vim.o.cursorline = true
vim.o.cursorcolumn = true
vim.o.colorcolumn  = '80'

vim.g.user_emmet_leader_key = ','
