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
		event = "VeryLazy",
		dependencies = {
			{
				"zbirenbaum/copilot-cmp",
				verylazy = true,
				dependencies = "copilot.lua",
				opts = {},
				config = function(_, opts)
					local copilot_cmp = require("copilot_cmp")
					copilot_cmp.setup(opts)
				end,
			},
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
