local luasnip = require("luasnip")
-- some shorthands...
local snippet = luasnip.snippet
-- local sn = luasnip.snippet_node
local t = luasnip.text_node
local i = luasnip.insert_node
-- local f = luasnip.function_node
-- local c = luasnip.choice_node
-- local d = luasnip.dynamic_node
-- local r = luasnip.restore_node
-- local l = require("luasnip.extras").lambda
-- local rep = require("luasnip.extras").rep
-- local p = require("luasnip.extras").partial
-- local m = require("luasnip.extras").match
-- local n = require("luasnip.extras").nonempty
-- local dl = require("luasnip.extras").dynamic_lambda
-- local fmt = require("luasnip.extras.fmt").fmt
-- local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
-- local conds = require("luasnip.extras.expand_conditions")

-- If you're reading this file for the first time, best skip to around line 170
-- where the actual snippet-definitions start.

-- Every unspecified option will be set to the default.
luasnip.config.set_config(
    {
        history = true,
        -- Update more often, :h events for more info.
        updateevents = "TextChanged,TextChangedI",
        ext_opts = {
            [types.choiceNode] = {
                active = {
                    virt_text = {{"choiceNode", "Comment"}}
                }
            }
        },
        -- treesitter-hl has 100, use something higher (default is 200).
        ext_base_prio = 300,
        -- minimal increase in priority.
        ext_prio_increase = 1,
        enable_autosnippets = true
    }
)

luasnip.snippets = {
    -- When trying to expand a snippet, luasnip first searches the tables for
    -- each filetype specified in 'filetype' followed by 'all'.
    -- If ie. the filetype is 'lua.c'
    --     - luasnip.lua
    --     - luasnip.c
    --     - luasnip.all
    -- are searched in that order.
    javascriptreact = {
        snippet(
            "cmp",
            {
                t({"export function "}),
                i(1),
                t({"() {", "\treturn (", '\t\t<div className="'}),
                i(2),
                t({'">'}),
                i(3),
                t({"</div>", "\t);", "}"})
            }
        )
    },
    python = {
        snippet(
            "doc",
            {
                t({'"""'}),
                t({""}),
                i(1),
                t({'"""'})
            }
        ),
        snippet(
            "main",
            {
                t({'if __name__ == "__main__":', "\tmain("}),
                i(1),
                t({")"})
            }
        ),
        snippet(
            "def",
            {
                t({"def "}),
                i(1),
                t({"("}),
                i(2),
                t({"):", "\t"}),
                i(3)
            }
        ),
        snippet(
            "if",
            {
                t({"if "}),
                i(1),
                t({":", "\t"}),
                i(2)
            }
        )
    }
}
