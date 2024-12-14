return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
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
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		{
			"hrsh7th/nvim-cmp",
			dependencies = { "onsails/lspkind-nvim" },
		},
		{
			"L3MON4D3/LuaSnip",
			dependencies = { "rafamadriz/friendly-snippets" },
		},
		"saadparwaiz1/cmp_luasnip",
		"j-hui/fidget.nvim",
	},
	event = "LspAttach",
	config = function()
		local lspconfig = require("lspconfig")

		local cmp = require("cmp")
		local lspkind = require("lspkind")
		local cmp_lsp = require("cmp_nvim_lsp")
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities()
		)
		require("fidget").setup({})
		---@diagnostic disable-next-line: missing-fields
		require("mason-lspconfig").setup({
			handlers = {
				function(server_name) -- default handler (optional)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
					})
				end,
				["lua_ls"] = function()
					lspconfig.lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim", "it", "describe", "before_each", "after_each" },
								},
							},
						},
					})
				end,
				["emmet_language_server"] = function()
					lspconfig.emmet_language_server = {
						capabilities = capabilities,
						filetypes = {
							"css",
							"eruby",
							"html",
							"javascript",
							"typescript",
							"javascriptreact",
							"typescriptreact",
							"less",
							"sass",
							"scss",
							"pug",
						},
					}
				end,
				["basedpyright"] = function()
					lspconfig.basedpyright = {
						analysis = {
							typeCheckingMode = "standard",
							autoSearchPaths = true,
							useLibraryCodeForTypes = true,
							autoImportCompletions = true,
							diagnosticsMode = "openFilesOnly",
						},
					}
				end,
			},
		})

		---@diagnostic disable-next-line: assign-type-mismatch
		require("luasnip.loaders.from_lua").load({ paths = vim.fn.getenv("HOME") .. "/.config/nvim/lua/snippets/" })
		require("luasnip.loaders.from_vscode").lazy_load()
		local cmp_select = { behavior = cmp.SelectBehavior.Select }

		local cmp_opts = {
			-- Auto selects first item in completion list
			completion = {
				completeopt = "menu,menuone,noinsert",
			},
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
				end,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
				["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
				["<C-y>"] = cmp.mapping.confirm({ select = true }),
				["<C-Space>"] = cmp.mapping.complete(),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{
					name = "lazydev",
					group_index = 0, -- set group index to 0 to skip loading LuaLS completions
				},
				{ name = "luasnip" }, -- For luasnip users.
				{ name = "codeium" },
				{ name = "copilot" },
			}, {
				{ name = "buffer" },
			}),
			cmp.setup.cmdline("/", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			}),
			formatting = {
				format = lspkind.cmp_format({
					mode = "symbol_text",
					menu = {
						buffer = "[Buffer]",
						nvim_lsp = "[LSP]",
						luasnip = "[LuaSnip]",
						nvim_lua = "[Lua]",
						latex_symbols = "[Latex]",
					},
				}),
			},
		}
		cmp_opts = vim.tbl_deep_extend("force", cmp_opts, require("nvchad.cmp"))
		cmp.setup(cmp_opts)

		vim.diagnostic.config({
			-- update_in_insert = true,
			float = {
				focusable = false,
				style = "default",
				border = "rounded",
				source = true,
				header = "",
				prefix = "",
			},
		})
		vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
		vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
		vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
	end,
}
