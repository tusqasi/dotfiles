function Runner(file)
    vim.cmd("belowright 5split")
    vim.cmd(string.format("terminal python %s", file))
end


vim.api.nvim_buf_set_keymap(0, "n", "<CR>", "<CMD>lua Runner(vim.fn.expand('%'))<CR>", {silent = true})
