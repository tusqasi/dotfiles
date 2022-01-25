vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.api.nvim_buf_set_keymap(0, "n", "<CR>", "<CMD>!luafmt --write-mode=replace %<CR><CMD>e!<CR>", {silent = true})
