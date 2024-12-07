return {
	"NeogitOrg/neogit",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"sindrets/diffview.nvim", -- optional - Diff integration

		-- Only one of these is needed, not both.
		"nvim-telescope/telescope.nvim", -- optional
	},
	enabled = false,
	config = function()
		local neogit = require("neogit")

		neogit.setup({
			graph_style = "unicode",
			signs = {
				item = { "⇢", "⇣" },
				section = { "⇢", "⇣" },
			},
			integrations = {
				telescope = true,
				diffview = true,
			},
		})
		vim.keymap.set("n", "<leader>ng", "<cmd>Neogit<CR>", {})
		vim.keymap.set("n", "<leader>nd", "<cmd>Neogit diff<CR>", {})
	end,
}
