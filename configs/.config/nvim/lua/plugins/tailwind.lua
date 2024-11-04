return {
	{
		"luckasRanarison/tailwind-tools.nvim",
		name = "tailwind-tools",
		build = ":UpdateRemotePlugins",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-telescope/telescope.nvim", -- optional
			"neovim/nvim-lspconfig", -- optional
		},
		opts = {}, -- your configuration
	},
	{
		"nvim-cmp",
		event = "VeryLazy",
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
