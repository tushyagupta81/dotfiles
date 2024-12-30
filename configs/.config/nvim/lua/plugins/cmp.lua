---@diagnostic disable: missing-fields
return {
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		"saghen/blink.cmp",
		lazy = false, -- lazy loading handled internally
		dependencies = {
      "rafamadriz/friendly-snippets",
			{
				"L3MON4D3/LuaSnip",
				version = "v2.*",
				config = function()
					---@diagnostic disable-next-line: assign-type-mismatch
					require("luasnip.loaders.from_lua").load({ paths = vim.fn.stdpath("config") .. "/snippets" })
					require("luasnip.loaders.from_vscode").lazy_load()
				end,
			},
		},
		version = "v0.*",
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = { preset = "default" },

			appearance = {
				nerd_font_variant = "mono",
			},

			snippets = {
				expand = function(snippet)
					require("luasnip").lsp_expand(snippet)
				end,
				active = function(filter)
					if filter and filter.direction then
						return require("luasnip").jumpable(filter.direction)
					end
					return require("luasnip").in_snippet()
				end,
				jump = function(direction)
					require("luasnip").jump(direction)
				end,
			},

			-- default list of enabled providers defined so that you can extend it
			-- elsewhere in your config, without redefining it, via `opts_extend`
			sources = {
				default = { "lsp", "lazydev", "luasnip", "path", "buffer" },
				min_keyword_length = 0,
				providers = {
					-- dont show LuaLS require statements when lazydev has items
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 100, -- show at a higher priority than lsp
						fallbacks = { "lsp" },
					},
				},
				-- optionally disable cmdline completions
				-- cmdline = {},
			},

			completion = {
				accept = {
					auto_brackets = {
						enabled = true,
					},
				},
				menu = {
					auto_show = true,
					draw = {
						---@diagnostic disable-next-line: assign-type-mismatch
						treesitter = { "lsp" },
						columns = {
							{ "kind_icon", "sperator", gap = 1 },
							{ "label", "label_description", gap = 1 },
							-- { "sperator", "kind", gap = 0 },
							{ "kind" },
						},
						components = {
							sperator = {
								ellipsis = false,
								width = { fill = true },
								text = function()
									return "┃"
								end,
							},
						},
					},
					border = "rounded",
					scrollbar = false,
				},
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 200,
					window = {
						border = "rounded",
						winblend = 0,
						max_width = 100,
					},
				},
				ghost_text = {
					enabled = false,
				},
			},

			-- experimental signature help support
			signature = {
				enabled = true,
				window = {
					border = "rounded",
				},
			},
		},
		-- allows extending the providers array elsewhere in your config
		-- without having to redefine it
		-- opts_extend = { "sources.default" },
		opts_extend = { "sources.completion.enabled_providers" },
	},
}
