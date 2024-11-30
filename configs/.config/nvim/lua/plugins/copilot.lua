return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "VeryLazy",
		enabled = false,
		config = function()
			require("copilot").setup({
				suggestion = { enabled = false },
				panel = { enabled = false },
			})
		end,
	},
	{
		"nvim-cmp",
		dependencies = {
			"luckasRanarison/tailwind-tools.nvim",
			"onsails/lspkind-nvim",
		},
		config = function()
			local cmp = require("cmp")
			cmp.setup({
				formatting = {
					format = require("lspkind").cmp_format({
						mode = "symbol",
						max_width = 50,
						symbol_map = {
							Copilot = "",
						},
					}),
				},
			})
		end,
	},
}
