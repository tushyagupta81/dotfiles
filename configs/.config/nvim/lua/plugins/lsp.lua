return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		-- "hrsh7th/cmp-nvim-lsp",
		-- "hrsh7th/cmp-buffer",
		-- "hrsh7th/cmp-path",
		-- "hrsh7th/cmp-cmdline",
		-- "hrsh7th/nvim-cmp",
		-- "rafamadriz/friendly-snippets",
		-- "L3MON4D3/LuaSnip",
		-- "saadparwaiz1/cmp_luasnip",
		"j-hui/fidget.nvim",
	},
	event = "LspAttach",
	config = function()
		local lspconfig = require("lspconfig")

		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities()
			-- cmp_lsp.default_capabilities()
		)
		require("fidget").setup({})
		require("mason-lspconfig").setup({
			handlers = {
				function(server_name) -- default handler (optional)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
					})
				end,
				["lua_ls"] = function()
					lspconfig.lua_ls = {
						capabilities = capabilities,
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim", "it", "describe", "before_each", "after_each" },
								},
							},
						},
					}
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
		-- require("luasnip.loaders.from_vscode").lazy_load()
		-- local cmp_select = { behavior = cmp.SelectBehavior.Select }

		-- cmp.setup({
		-- 	-- Auto selects first item in completion list
		-- 	completion = {
		-- 		completeopt = "menu,menuone,noinsert",
		-- 	},
		-- 	snippet = {
		-- 		expand = function(args)
		-- 			require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
		-- 		end,
		-- 	},
		-- 	window = {
		-- 		completion = cmp.config.window.bordered(),
		-- 		documentation = cmp.config.window.bordered(),
		-- 	},
		-- 	mapping = cmp.mapping.preset.insert({
		-- 		["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
		-- 		["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
		-- 		["<C-y>"] = cmp.mapping.confirm({ select = true }),
		-- 		["<C-Space>"] = cmp.mapping.complete(),
		-- 	}),
		-- 	sources = cmp.config.sources({
		-- 		{ name = "nvim_lsp" },
		-- 		{ name = "luasnip" }, -- For luasnip users.
		-- 		{ name = "codeium" },
		-- 		{ name = "copilot" },
		-- 	}, {
		-- 		{ name = "buffer" },
		-- 	}),
		-- })

		vim.diagnostic.config({
			-- update_in_insert = true,
			float = {
				focusable = false,
				style = "default",
				border = "rounded",
				source = "always",
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
