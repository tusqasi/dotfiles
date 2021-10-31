M = {}

M.buf_search = function()
  require("telescope.builtin").current_buffer_fuzzy_find()
end

M.buffers = function()
  require("telescope.builtin").buffers()
end
M.registers = function()
  require("telescope.builtin").registers()
end

M.builtin = function()
  require("telescope.builtin").builtin()
end

M.fd = function()
  require("telescope.builtin").fd()
end

M.file_browser = function()
  require("telescope.builtin").file_browser()
end

M.nvim_configs = function()
  local opts = {
    cwd = vim.g.nvim_dir,
    find_files = "rd"
  }
  require("telescope.builtin").find_files(
    {
      cwd = vim.g.nvim_dir,
      file_ignore_patterns = {"swapfiles", "undodir"}
    }
  )
end

-- open nvim config
--[[ M.get_files = function()
end ]]
return M
