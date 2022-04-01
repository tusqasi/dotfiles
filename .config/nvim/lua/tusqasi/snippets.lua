local luasnip = require("luasnip")

-- some shorthands...
local snippet = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node
local f = luasnip.function_node
local d = luasnip.dynamic_node
local c = luasnip.choice_node
local snippet_from_nodes = luasnip.sn
local fmt = require("luasnip.extras.fmt").fmt

local same = function(index)
    return f(
        function(args)
            return args[1]
        end,
        {index}
    )
end
local types = require("luasnip.util.types")
-- Every unspecified option will be set to the default.
luasnip.config.set_config(
    {
        history = true,
        updateevents = "TextChanged,TextChangedI,InsertLeave",
        ext_opts = {
            [types.choiceNode] = {
                active = {
                    virt_text = {{"choiceNode", "Comment"}}
                }
            }
        },
        ext_base_prio = 300,
        ext_prio_increase = 1,
        enable_autosnippets = false
    }
)
luasnip.snippets = {
    lua = {
        snippet(
            "use",
            {
                f(
                    function()
                        return string.format([[use "%s"]], vim.fn.getreg("+"))
                    end
                )
            }
        )
    },
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
    cpp = {
        snippet("func", fmt([[{} {}({}) {{
    {};
}}]], {i(1, {"int"}), i(2), i(3, {"int n"}), i(4)}))
    }
}

-- add snippet library
--
require("luasnip.loaders.from_vscode").load()
