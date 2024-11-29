return {
	"folke/trouble.nvim",
	event = "VeryLazy",
	config = function()
		require("trouble").setup({})
		vim.keymap.set("n", "<leader>tt", "<cmd>Trouble diagnostics toggle<cr>")
	end,
}
