local ls = require("luasnip")
local s = ls.snippet
-- local t = ls.text_node
local i = ls.insert_node

local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("js", {
	s(
		"con",
		fmt(
			[[
    console.log({});
    ]],
			{ i(0) }
		)
	),
})
