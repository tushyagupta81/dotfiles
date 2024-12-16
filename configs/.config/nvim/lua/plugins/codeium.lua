return {
	"Exafunction/codeium.nvim",
	lazy = true,
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("codeium").setup({})
	end,
}
