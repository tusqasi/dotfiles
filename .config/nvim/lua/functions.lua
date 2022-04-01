M = {}

M.buf_search = function()
    vim.cmd(":Telescope current_buffer_fuzzy_find")
end

M.buffers = function()
    vim.cmd(":Telescope buffers")
end
M.registers = function()
    vim.cmd(":Telescope registers")
end

M.builtin = function()
    vim.cmd(":Telescope builtin")
end

M.fd = function()
    vim.cmd(":Telescope fd")
end

M.file_browser = function()
    vim.cmd(":Telescope file_browser")
end

M.nvim_configs = function()
    local opts = {
        cwd = vim.g.nvim_dir,
        find_files = "rd"
    }
    require("telescope.builtin").find_files(opts)
end

M.grep_nvim_configs = function()
    local opts = {
        cwd = vim.g.nvim_dir,
        find_files = "rd"
    }
    vim.cmd(":Telescope live_grep")
end

-- open nvim config
--[[ M.get_files = function()
end ]]
return M
