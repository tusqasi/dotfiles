local luasnip = require("luasnip")

-- some shorthands...
local snippet = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node
local types = require("luasnip.util.types")

-- Every unspecified option will be set to the default.
luasnip.config.set_config(
    {
        history = true,
        updateevents = "TextChanged,TextChangedI",
        ext_opts = {
            [types.choiceNode] = {
                active = {
                    virt_text = {{"choiceNode", "Comment"}}
                }
            }
        },
        ext_base_prio = 300,
        ext_prio_increase = 1,
        enable_autosnippets = true
    }
)

luasnip.snippets = {
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
    },
    dart = {
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
    }
}

-- add snippet library
-- require("luasnip.loaders.from_vscode").load()
-- require("luasnip").filetype_extend("dart", {"flutter"})
