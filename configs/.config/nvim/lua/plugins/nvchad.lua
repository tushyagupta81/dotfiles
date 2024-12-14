return {
	{
    lazy=true,
    "nvim-lua/plenary.nvim",
  },
	{
		"nvchad/ui",
		config = function()
			require("nvchad")
		end,
	},
	{
		"nvchad/base46",
		lazy = true,
		build = function()
			require("base46").load_all_highlights()
		end,
	},
	{ "nvzone/volt", lazy = true },
	{
		"nvzone/minty",
    lazy = true,
		cmd = { "Shades", "Huefy" },
	},
}
