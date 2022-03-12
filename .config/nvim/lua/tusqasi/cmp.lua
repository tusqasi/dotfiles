-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- luasnip setup
local luasnip = require "luasnip"

-- nvim-cmp setup
local cmp = require "cmp"
cmp.setup {
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end
    },
    mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = function(fallback)
            if luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end,
        ["<CR>"] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true
        }
    },
    -- sources are in order
    sources = {
        {name = "nvim_lsp", keyword_length = 2},
        {name = "path", keyword_length = 2},
        {name = "luasnip", keyword_length = 2}
    }
}

require "cmp".setup.cmdline(
    ":",
    {
        sources = {
            {name = "cmdline", keyword_length = 2}
        }
    }
)
