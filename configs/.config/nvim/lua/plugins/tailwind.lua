return {
	{
		"luckasRanarison/tailwind-tools.nvim",
		event = "VeryLazy",
		name = "tailwind-tools",
		build = ":UpdateRemotePlugins",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-telescope/telescope.nvim", -- optional
			"neovim/nvim-lspconfig", -- optional
		},
		opts = {
			document_color = {
				enabled = true, -- can be toggled by commands
				kind = "background", -- "inline" | "foreground" | "background"
				debounce = 200, -- in milliseconds, only applied in insert mode
			},
			cmp = {
				highlight = "foreground", -- color preview style, "foreground" | "background"
			},
		}, -- your configuration
	},
	{
		"hrsh7th/nvim-cmp",
		event = "VimEnter",
		dependencies = {
			"tailwind-tools",
			"onsails/lspkind-nvim",
		},
		config = function()
			local cmp = require("cmp")
			cmp.setup({
				formatting = {
					format = require("lspkind").cmp_format({
						before = require("tailwind-tools.cmp").lspkind_format,
					}),
				},
			})
		end,
	},
}
