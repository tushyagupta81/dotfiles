local ls = require("luasnip")
local s = ls.snippet
-- local t = ls.text_node
local i = ls.insert_node

local fmt = require("luasnip.extras.fmt").fmt

local shared_snippets = {
	-- Function snippet using fmt for formatting
	s(
		"con",
		fmt([[console.log({});]], {
			i(0),
		})
	),
}

-- Register the snippets for both js and jsx
ls.add_snippets(nil, {
	js = shared_snippets,
	jsx = shared_snippets,
})
