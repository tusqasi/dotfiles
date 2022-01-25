local telescope = require("telescope")

telescope.setup {
  defaults = {
    prompt_prefix = "🔍 > ",
    selection_caret = " ",
    entry_prefix = "  "
  }
}
