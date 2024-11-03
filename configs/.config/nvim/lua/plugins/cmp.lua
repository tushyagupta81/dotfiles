return {
	{
		"saghen/blink.cmp",
		dependencies = "rafamadriz/friendly-snippets",
		event = "InsertEnter",
		version = "v0.*", -- REQUIRED release tag needed to download pre-built binaries
		opts = {
			nerd_font_variant = "mono",

			keymap = {
				preset = "default",
			},

			sources = {
				completion = {
					enabled_providers = { "lsp", "path", "snippets", "buffer" },
				},
				accept = { auto_brackets = { enabled = true } },

				-- experimental signature help support
				trigger = { signature_help = { enabled = true } },
			},

			windows = {
				autocomplete = {
					min_width = 20,
					max_width = 40,
					max_height = 15,
					border = "rounded",
					draw = "reversed",
					scrolloff = 2,
					direction_priority = { "s", "n" },
					winblend = 0,
				},
				documentation = {
					min_width = 15,
					max_width = 50,
					max_height = 20,
					border = "rounded",
					direction_priority = {
						autocomplete_north = { "e", "w", "n", "s" },
						autocomplete_south = { "e", "w", "s", "n" },
					},
					auto_show = true,
					auto_show_delay_ms = 500,
					update_delay_ms = 100,
					winblend = 0,
				},
			},

			kind_icons = {
				Text = "",
				Method = "󰆧",
				Function = "󰊕",
				Constructor = "",
				Field = "󰇽",
				Variable = "󰂡",
				Class = "󰠱",
				Interface = "",
				Module = "",
				Property = "󰜢",
				Unit = "",
				Value = "󰎠",
				Enum = "",
				Keyword = "󰌋",
				Snippet = "󰅱",
				Color = "󰏘",
				File = "󰈙",
				Reference = "",
				Folder = "󰉋",
				EnumMember = "",
				Constant = "󰏿",
				Struct = "",
				Event = "",
				Operator = "󰆕",
				TypeParameter = "󰅲",
			},
		},
	},
	-- LSP servers and clients communicate what features they support through "capabilities".
	--  By default, Neovim support a subset of the LSP specification.
	--  With blink.cmp, Neovim has *more* capabilities which are communicated to the LSP servers.
	--  Explanation from TJ: https://youtu.be/m8C0Cq9Uv9o?t=1275
	--
	-- This can vary by config, but in-general for nvim-lspconfig:
	{
		"neovim/nvim-lspconfig",
		dependencies = { "saghen/blink.cmp" },
		config = function(_, opts)
			local lspconfig = require("lspconfig")
			for server, config in pairs(opts.servers) do
				config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
				lspconfig[server].setup(config)
			end
		end,
	},
}
