local mappings = {}

local opts = {
  sorting_strategy = "ascending",
  layout_config = {prompt_position = "top"}
}
mappings.current_buffer_fuzzy_find = function()
  require("telescope.builtin").current_buffer_fuzzy_find(opts)
end
mappings.find_files = function()
  require("telescope.builtin").find_files(opts)
end

mappings.buffers = function()
  require("telescope.builtin").buffers(opts)
end
mappings.registers = function()
  require("telescope.builtin").registers(opts)
end
mappings.builtin = function()
  require("telescope.builtin").builtin(opts)
end
return mappings
--[[
-- search for open buffers
nnoremap <Leader>b :Telescope buffers<CR>

-- better search
nnoremap <Leader>/ <CMD>lua require('telescope.builtin').current_buffer_fuzzy_find({sorting_strategy='ascending',layout_config={prompt_position='top'}})<CR>
-- find files 
nnoremap <Leader>F <CMD>lua require('telescope.builtin').fd()<CR>

-- get register contents
nnoremap <Leader>R :Telescope registers<CR>
-- nnoremap <Leader>Rc :asdf

]]
