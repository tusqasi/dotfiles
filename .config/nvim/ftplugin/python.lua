function Runner(file)
    vim.cmd("update")
    vim.cmd("belowright 9split")
    vim.cmd(string.format("terminal env python %s", file))
end

-- vim.api.nvim_buf_set_keymap(0, "n", "<CR>", "<CMD>lua Runner(vim.fn.expand('%'))<CR>", {silent = true})
