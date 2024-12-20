return {
	"Wansmer/treesj",
	event = "VeryLazy",
	keys = {
		"<space>m",
		-- "<space>j",
		-- "<space>s",
	},
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	}, -- if you install parsers with `nvim-treesitter`
	config = function()
		require("treesj").setup({})
	end,
}
