local function lines()
  local file = vim.fn.expand('%:p')
  if file == nil or #file == 0 then
    return ''
  end
  -- P(#vim.fn.getbufline(file,0,"$"))
return #vim.fn.getbufline(file,0,'$')
end

require "lualine".setup {
    sections = {
        lualine_a = {"mode"},
        lualine_b = {
            "branch",
            "diff",
            {"diagnostics", sources = {"nvim_diagnostic"}}
        },
        lualine_c = {"filename"},
        lualine_w = {"encoding", "fileformat", "filetype"},
        lualine_x = {"progress"},
        lualine_y = {"location"},
        lualine_z = {lines}
    }
}
