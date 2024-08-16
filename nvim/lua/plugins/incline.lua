return {
	"b0o/incline.nvim",
	dependencies = { "SmiteshP/nvim-navic" },
	event = "BufReadPre",
	priority = 1200,
	config = function()
		require("incline").setup({})
	end,
}
