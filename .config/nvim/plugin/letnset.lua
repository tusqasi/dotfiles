vim.g.user_emmet_install_global = 0
local M = {}

local cmd = vim.cmd

function M.create_augroup(autocmds, name)
    cmd("augroup " .. name)
    cmd("autocmd!")
    for _, autocmd in ipairs(autocmds) do
        cmd("autocmd " .. table.concat(autocmd, " "))
    end
    cmd("augroup END")
end
M.create_augroup(
    {
        {
            "BufEnter",
            "*.html,*.css,*.js",
            ":EmmetInstall"
        }
    },
    "emmet"
)

vim.opt.mouse = "a"

-- no netrw_banner
vim.g.netrw_banner = false

-- don't show the mode
vim.opt.showmode= false

-- Don't break words
vim.opt.linebreak = true
-- Enable folding
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 99
-- Numberline settings
-- Hybrid numbers
vim.opt.number = true

vim.opt.relativenumber = true
-- Encoding
vim.opt.encoding = "utf-8"
-- Tab to 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.api.nvim_command("filetype off")

vim.opt.fillchars = {
    vert = "▕", -- alternatives │
    fold = " ",
    eob = " ", -- suppress ~ at EndOfBuffer
    diff = "╱", -- alternatives = ⣿ ░ ─
    msgsep = "‾",
    foldopen = "▾",
    foldsep = "│",
    foldclose = "▸"
}

vim.opt.listchars = {
    eol = nil,
    tab = "│ ",
    extends = "»",
    precedes = "«",
    trail = "•"
}
-- don't close exited buffer
vim.opt.hidden = true
-- Backups and swap and such

vim.opt.swapfile = true
vim.opt.undofile = true
-- Persistent Undo
vim.opt.undodir = vim.env.HOME .. "/.local/share/nvim/undodir/"

-- Make those folders automatically if they don't already exist.
-- if vim.fn.isdirectory(vim.o.undodir) == 0 then
vim.fn.mkdir(vim.o.undodir, "p")
-- end

vim.api.nvim_command("syntax on")

-- Settings for search
vim.opt.incsearch = true
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = "nosplit"
vim.opt.updatetime = 10
-- vim.opt.wildignore = vim.opt.wildignore .. "*/tmp/*,*.so,*.swp,*.zip,*.gz*"
vim.opt.wildignore = {
    "*.aux",
    "*.avi",
    "*.class",
    "*.dll",
    "*.gif",
    "*.gz",
    "*.ico",
    "*.jar",
    "*.jpeg",
    "*.jpg",
    "*.o",
    "*.obj",
    "*.out",
    "*.png",
    "*.pyc",
    "*.rbc",
    "*.toc",
    "*.wav",
    "*.zip",
    -- Temp/System
    "*/tmp/*",
    "*.*~",
    "*.swp",
    "*~ ",
    ".DS_Store",
    "*.so",
    ".lock",
    "tags.lock"
}

-- better use bash instead of fish
-- vim.opt.shell = "/usr/bin/bash"
