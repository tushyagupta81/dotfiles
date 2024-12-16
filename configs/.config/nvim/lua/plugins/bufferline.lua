return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local bufferline = require("bufferline")
		bufferline.setup({
			options = {
				style_preset = bufferline.style_preset.minimal, -- or bufferline.style_preset.minimal,
				numbers = "ordinal",
				indicator = {
					style = "icon",
				},

				diagnostics = "nvim_lsp",
			},
		})
	end,
}
