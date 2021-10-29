local telescope = require("telescope")

telescope.setup {
  defaults = {
    prompt_prefix = "   ",
    selection_caret = "  ",
    entry_prefix = "  "
    -- file_previewer = require("telescope.previewers").vim_buffer_cat.new
  }
}
