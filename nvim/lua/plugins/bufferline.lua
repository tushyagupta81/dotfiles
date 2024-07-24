return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local bufferline = require("bufferline")
		bufferline.setup({
			options = {
				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(count, level)
					local icon = level:match("error") and " " or ""
					return icon .. " " .. count
				end,
				style_preset = {
					bufferline.style_preset.minimal,
				},
				numbers = "ordinal",
				groups = {
					items = {
						require("bufferline.groups").builtin.pinned:with({ icon = "" }),
					},
				},
				show_buffer_close_icons = false,
				show_close_icon = false,
				hover = {
					enabled = true,
					delay = 200,
					reveal = { "close" },
				},
			},
		})
		vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
		vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>pin", ":BufferLineTogglePin<CR>", { noremap = true, silent = true })
	end,
}
