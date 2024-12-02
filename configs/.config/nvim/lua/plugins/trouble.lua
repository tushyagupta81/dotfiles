return {
	"folke/trouble.nvim",
	event = "VeryLazy",
	config = function()
		require("trouble").setup({})
		vim.keymap.set("n", "<leader>tt", "<cmd>Trouble diagnostics toggle<cr>")
		vim.keymap.set("n", "]t", "<cmd>Trouble diagnostics next follow=true<cr>")
		vim.keymap.set("n", "[t", "<cmd>Trouble diagnostics prev follow=true<cr>")
	end,
}
