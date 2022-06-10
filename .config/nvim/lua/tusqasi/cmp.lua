-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- luasnip setup
local luasnip = require "luasnip"

-- nvim-cmp setup
local cmp = require "cmp"
cmp.setup {
    completion = {
        autocomplete = false
    },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },
    mapping = {
        ["<tab>"] = cmp.config.disable,
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping(
            function(fallback)
                luasnip.expand_or_jump()
            end,
            {"i", "s"}
        ),
        ["<CR>"] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Insert,
            select = true
        }
    },
    -- sources are in order
    sources = {
        {name = "luasnip", keyword_length = 2},
        {name = "nvim_lsp", keyword_length = 2},
        {name = "path", keyword_length = 2}
    }
}

cmp.setup.filetype(
    {"markdown", "help"},
    {
        sources = {
            {name = "path"},
            {name = "buffer"},
            {name = "spell"}
        }
    }
)

-- require "cmp".setup.cmdline(
--     ":",
--     {
--         sources = {
--             {name = "cmdline", keyword_length = 2}
--         }
--     }
-- )
