return {
	{
		"hrsh7th/nvim-cmp",
		enabled = false,
	},
	{
		"saghen/blink.cmp",
		dependencies = {
			-- add blink.compat to dependencies
			{
				"saghen/blink.compat",
				version = "event",
				opts = {
					enable_events = true,
				},
			},
			{
				"Exafunction/codeium.nvim",
				cmd = "Codeium",
				build = ":Codeium Auth",
				opts = { enable_cmp_source = true },
			},
			"rafamadriz/friendly-snippets",
		},
		event = "BufReadPre",
		version = "v0.*", -- REQUIRED release tag to download pre-built binaries
		-- https://github.com/chrisgrieser/.config/blob/main/nvim/lua/plugins/blink-cmp.lua

		---@module "blink.cmp"
		---@type blink.cmp.Config
		opts = {
			sources = {
				completion = {
					enabled_providers = { "lsp", "path", "snippets", "buffer", "codeium" },
				},
				providers = {
					lsp = {
						name = "LSP",
						module = "blink.cmp.sources.lsp",

						--- *All* of the providers have the following options available
						--- NOTE: All of these options may be functions to get dynamic behavior
						--- See the type definitions for more information
						enabled = true, -- whether or not to enable the provider
						transform_items = nil, -- function to transform the items before they're returned
						should_show_items = true, -- whether or not to show the items
						max_items = nil, -- maximum number of items to return
						min_keyword_length = 0, -- minimum number of characters to trigger the provider
						fallback_for = {}, -- if any of these providers return 0 items, it will fallback to this provider
						score_offset = 0, -- boost/penalize the score of the items
						override = nil, -- override the source's functions
					},
					path = {
						name = "Path",
						module = "blink.cmp.sources.path",
						score_offset = 3,
						opts = {
							trailing_slash = false,
							label_trailing_slash = true,
							get_cwd = function(context)
								return vim.fn.expand(("#%d:p:h"):format(context.bufnr))
							end,
							show_hidden_files_by_default = false,
						},
					},
					snippets = {
						name = "Snippets",
						module = "blink.cmp.sources.snippets",
						score_offset = -3,
						opts = {
							friendly_snippets = true,
							search_paths = { vim.fn.stdpath("config") .. "/snippets" },
							global_snippets = { "all" },
							extended_filetypes = {},
							ignored_filetypes = {},
						},

						--- Example usage for disabling the snippet provider after pressing trigger characters (i.e. ".")
						-- enabled = function(ctx) return ctx ~= nil and ctx.trigger.kind == vim.lsp.protocol.CompletionTriggerKind.TriggerCharacter end,
					},
					buffer = {
						name = "Buffer",
						module = "blink.cmp.sources.buffer",
						fallback_for = { "lsp" },
					},
					codeium = {
						name = "codeium", -- IMPORTANT: use the same name as you would for nvim-cmp
						module = "blink.compat.source",
						opts = {
							icon = "%",
						},
					},
				},
			},
			trigger = {
				completion = {
					keyword_range = "full", -- full|prefix
				},
			},
			highlight = {
				use_nvim_cmp_as_default = true,
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
					draw = function(ctx)
						-- https://github.com/Saghen/blink.cmp/blob/9846c2d2bfdeaa3088c9c0143030524402fffdf9/lua/blink/cmp/types.lua#L1-L6
						-- https://github.com/Saghen/blink.cmp/blob/9846c2d2bfdeaa3088c9c0143030524402fffdf9/lua/blink/cmp/windows/autocomplete.lua#L298-L349
						-- differentiate LSP snippets from user snippets and emmet snippets
						local source, client = ctx.item.source_id, ctx.item.client_id
						if client and vim.lsp.get_client_by_id(client).name == "emmet_language_server" then
							source = "emmet"
						end

						local sourceIcons = { snippets = "󰩫", buffer = "󰦨", emmet = "", codeium = "⫷" }
						local icon = sourceIcons[source] or ctx.kind_icon

						return {
							{
								" " .. ctx.item.label .. " ",
								fill = true,
								hl_group = ctx.deprecated and "BlinkCmpLabelDeprecated" or "BlinkCmpLabel",
								max_width = 40,
							},
							{ icon .. " ", hl_group = "BlinkCmpKind" .. ctx.kind },
						}
					end,
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
