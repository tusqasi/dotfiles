vim.opt.mouse = "a"

-- no netrw_banner
vim.g.netrw_banner = false

-- don't show the mode
vim.opt.showmode = false

-- Don't break words
vim.opt.linebreak = true
-- Enable folding
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 99
-- Numberline settings
-- Hybrid numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- just cause
vim.opt.laststatus = 2

vim.opt.signcolumn = "yes:2"
-- Encoding
vim.opt.encoding = "utf-8"

-- vim.api.nvim_command("filetype off")

vim.opt.list = true
-- vim.opt.fill = true
-- vim.opt.fillchars = {
-- 	vert = "▕", -- alternatives │
-- 	fold = " ",
-- 	eob = " ", -- suppress ~ at EndOfBuffer
-- 	diff = "╱", -- alternatives = ⣿ ░ ─
-- 	msgsep = "‾",
-- 	foldopen = "▾",
-- 	foldsep = "│",
-- 	foldclose = "▸",
-- }
vim.opt.listchars = {
	eol = "↲",
	tab = "» ",
	trail = "·",
	extends = "<",
	precedes = ">",
	conceal = "┊",
	nbsp = "␣",
}

-- vim.opt.listchars = {
--     eol = nil,
--     tab = "│ ",
--     extends = "»",
--     precedes = "«",
--     trail = "•"
-- }
-- don't close exited buffer
vim.opt.hidden = true

-- Backups and swap and such
vim.opt.swapfile = false

-- Persistent Undo
vim.opt.undofile = true
vim.opt.undodir = vim.env.HOME .. "/.local/share/nvim/undodir/"
-- Make those folders automatically if they don't already exist.
if not vim.fn.isdirectory(vim.o.undodir) then
	vim.fn.mkdir(vim.o.undodir, "p")
end

vim.api.nvim_command("syntax on")

-- Settings for search
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = "nosplit"
vim.opt.updatetime = 10
-- vim.opt.wildignore = {
--     "*.aux",
--     "*.avi",
--     "*.class",
--     "*.dll",
--     "*.gif",
--     "*.gz",
--     "*.ico",
--     "*.jar",
--     "*.jpeg",
--     "*.jpg",
--     "*.o",
--     "*.obj",
--     "*.out",
--     "*.png",
--     "*.pyc",
--     "*.rbc",
--     "*.toc",
--     "*.wav",
--     "*.zip",
--     -- Temp/System
--     "*/tmp/*",
--     "*.*~",
--     "*.swp",
--     "*~ ",
--     ".DS_Store",
--     "*.so",
--     ".lock",
--     "tags.lock"
-- }

-- better use bash instead of fish
vim.opt.shell = "/usr/bin/zsh"
vim.g.matchup_matchparen_enabled = 1
vim.g.matchup_matchparen_offscreen = {
	method = "popup",
}
vim.g.matchup_transmute_enabled = 1

vim.g.matchup_matchpref = {
	typescriptreact = { tagnameonly = 1 },
	tsx = { tagnameonly = 1 },
	html = { tagnameonly = 1 },
}
