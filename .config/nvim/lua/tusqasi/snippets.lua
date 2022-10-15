local luasnip = require("luasnip")

-- some shorthands...
local snippet = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node
local f = luasnip.function_node
-- local d = luasnip.dynamic_node
local c = luasnip.choice_node
-- local snippet_from_nodes = luasnip.sn
local fmt = require("luasnip.extras.fmt").fmt

-- local same = function(index)
--     return f(
--         function(args)
--             return args[1]
--         end,
--         {index}
--     )
-- end
local types = require("luasnip.util.types")
-- Every unspecified option will be set to the default.
luasnip.config.set_config({
	history = true,
	updateevents = "TextChanged,TextChangedI,InsertLeave",
	ext_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = { { "choiceNode", "Comment" } },
			},
		},
	},
	ext_base_prio = 300,
	ext_prio_increase = 1,
	enable_autosnippets = false,
})
--
-- luasnip.snippets = {
-- 	javascriptreact = {
-- 		snippet(
-- 			"cmp",
-- 			{
-- 				t({ "export function " }),
-- 				i(1),
-- 				t({ "() {", "\treturn (", '\t\t<div className="' }),
-- 				i(2),
-- 				t({ '">' }),
-- 				i(3),
-- 				t({ "</div>", "\t);", "}" })
-- 			}
-- 		)
-- 	},
-- 	python = {
-- 		snippet("route", fmt([[@app.route("{}")
-- def {}({}):
--     {}]], { i(1), i(2, { "home" }), i(3), i(4) }))
-- 	},
-- 	cpp = {
-- 		snippet("func", fmt([[{} {}({}) {{
--     {};
-- }}]], { i(1, { "int" }), i(2), i(3, { "int n" }), i(4) }))
-- 	},
-- 	javascript = {
-- 		snippet("log", fmt([[console.log({});]], { i(1) }))
-- 	}
-- }

-- add snippet library
--
require("luasnip.loaders.from_vscode").load()

-- luasnip.filetype_extend("dart", { "flutter" })

luasnip.add_snippets("lua", {
	snippet("use", {
		f(function()
			-- main clipboard
			local reg_content = vim.fn.getreg("+")
			--[[
			-- if starts with `use` then do some stuff
			--]]
			if reg_content:sub(1, 3) == "use" then
				return "use" .. string.match(reg_content, "'.*'")
			end
			return string.format([[use({"%s"})]], reg_content)
		end),
	}),
	snippet(
		"kms",
		fmt([[vim.keymap.set("n","{}", "<CMD>{}<CR>", {})]], { i(1, "<leader>"), i(2, "lua"), i(3, "options") })
	),
})
-- luasnip.add_snippets("flutter", {
-- 	snippet(
-- 		"nw",
-- 		fmt(
-- 			[[import 'package:flutter/material.dart';
-- {}]],
-- 			{ i(1, "statefulW") }
-- 		)
-- 	),
-- 	snippet("ic", fmt([[Icon(Icons.{})]], { i(1, "ic") })),
-- 	snippet(
-- 		"maa",
-- 		fmt([[mainAxisAlignment: MainAxisAlignment.{},]], { c(1, { t("start"), t("end"), t("center"), t("strech") }) })
-- 	),
-- 	snippet("caa", fmt([[crossAxisAlignment: CrossAxisAlignment.{},]], { i(1, "start") })),
-- 	snippet("thc", fmt([[Theme.of(context).{}]], { i(1) })),
-- })

luasnip.add_snippets("typescriptreact", {
	snippet(
		"cmp",
		fmt(
			[[
			const {} = ({{ {} }}:{{ {} }}): JSX.Element => {{
				return <>
					{}
				</>
			}}
			]],
			{ i(1, "name"), i(2, "props"), i(3, "types"), i(4, "content") }
		)
	),
})

luasnip.add_snippets("elixir", {
	snippet(
		"rec",
		fmt(
			[[receive do
	 {}->{}
 end]],
			{ i(1, "mes"), i(2, "do") }
		)
	),
	snippet(
		"rd",
		fmt(
			[[Enum.reduce({}
			{} , fn {} , {}->
			{}
			end)]],
			{ i(1, "x"), i(2, ", [],"), i(3, "x"), i(4, "acc"), i(5, "stuff") }
		)
	),
})
luasnip.add_snippets("c", {
	snippet(
		"mall",
		fmt(
			[[
			const {} = ({{ {} }}:{{ {} }}): JSX.Element => {{
				return <>
					{}
				</>
			}}
			]],
			{ i(1, "name"), i(2, "props"), i(3, "types"), i(4, "content") }
		)
	),
})
