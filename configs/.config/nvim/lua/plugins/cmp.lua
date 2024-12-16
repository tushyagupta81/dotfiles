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
			{
				"L3MON4D3/LuaSnip",
				version = "v2.*",
			},
			"rafamadriz/friendly-snippets",
		},
		version = "v0.*",
		init = function()
			---@diagnostic disable-next-line: assign-type-mismatch
			require("luasnip.loaders.from_lua").load({ paths = vim.fn.stdpath("config") .. "/snippets" })
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = { preset = "default" },

			appearance = {
				nerd_font_variant = "mono",
			},

			-- default list of enabled providers defined so that you can extend it
			-- elsewhere in your config, without redefining it, via `opts_extend`
			sources = {
				default = { "lsp", "path", "luasnip", "buffer", "lazydev" },
				min_keyword_length = 0,
				providers = {
					-- dont show LuaLS require statements when lazydev has items
					lsp = {
						fallback_for = { "lazydev" },
					},
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
					},
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
				-- optionally disable cmdline completions
				cmdline = {},
			},

			completion = {
				menu = {
          auto_show = true,
					draw = {
						---@diagnostic disable-next-line: assign-type-mismatch
						treesitter = { "lsp" },
						columns = {
							{ "kind_icon","sperator",gap=1},
							{ "label", "label_description", gap = 1 },
							{ "kind",  "source_name",gap=1 },
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
					border = "single",
					scrollbar = false,
				},
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 0,
					window = {
						border = "single",
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
			},
		},
		-- allows extending the providers array elsewhere in your config
		-- without having to redefine it
		-- opts_extend = { "sources.default" },
		opts_extend = { "sources.completion.enabled_providers" },
	},
}
