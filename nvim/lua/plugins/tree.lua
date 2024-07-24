return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	opts = {
		-- If a user has a sources list it will replace this one.
		-- Only sources listed here will be loaded.
		-- You can also add an external source by adding it's name to this list.
		-- The name used here must be the same name you would use in a require() call.
		sources = {
			"filesystem",
			"git_status",
			-- "document_symbols",
		},
		add_blank_line_at_top = false, -- Add a blank line at the top of the tree.
		close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
		source_selector = {
			statusline = true, -- toggle to show selector on statusline
		},
		window = { -- see https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/popup for
			-- possible options. These can also be functions that return these options.
			position = "right", -- left, right, top, bottom, float, current
			width = 35, -- applies to left and right positions
			height = 15, -- applies to top and bottom positions
			mapping_options = {
				noremap = true,
				nowait = true,
			},
		},
	},
	vim.keymap.set("n", "-", "<CMD>Neotree reveal right<CR>"),
}

-- return {
-- 	"nvim-tree/nvim-tree.lua",
-- 	config = function()
-- 		local nvim_tree = require("nvim-tree")
-- 		nvim_tree.setup({
-- 			view = {
-- 				mappings = {
-- 					list = {
-- 						{ key = "-", action = "" },
-- 					},
-- 				},
-- 				side = "right",
-- 				signcolumn = "yes",
-- 				width = 35,
-- 			},
-- 			mappings = {
-- 				custom_only = true,
-- 			},
-- 			ui = {
-- 				confirm = {
-- 					remove = true,
-- 					trash = true,
-- 					default_yes = true,
-- 				},
-- 			},
-- 			update_focused_file = {
-- 				enable = true,
-- 			},
-- 			renderer = {
-- 				indent_markers = {
-- 					enable = true,
-- 				},
-- 				icons = {
-- 					web_devicons = {
-- 						folder = {
-- 							enable = true,
-- 						},
-- 					},
-- 					glyphs = {
-- 						git = {
-- 							unstaged = "[+]",
-- 						},
-- 					},
-- 				},
-- 			},
-- 			git = {
-- 				enable = true,
-- 				show_on_dirs = true,
-- 				show_on_open_dirs = false,
-- 			},
-- 			diagnostics = {
-- 				enable = true,
-- 				show_on_dirs = false,
-- 			},
-- 			modified = {
-- 				enable = true,
-- 				show_on_dirs = true,
-- 				show_on_open_dirs = true,
-- 			},
-- 		})
-- 		vim.keymap.set("n", "-", "<CMD>NvimTreeFocus<CR>")
-- 	end,
-- }

-- return {
-- "stevearc/oil.nvim",
-- dependencies = { "nvim-tree/nvim-web-devicons" },
-- config = function()
-- 	require("oil").setup({
-- 		keymaps = {
-- 			["<C-h>"] = false,
-- 			["<C-l>"] = false,
-- 			["<C-j>"] = false,
-- 			["<C-k>"] = false,
-- 			["<leader>-"] = "actions.refresh",
-- 		},
-- 		view_options = {
-- 			-- Show files and directories that start with "."
-- 			show_hidden = true,
-- 		},
-- 	})
-- 	vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
-- end,
-- }
