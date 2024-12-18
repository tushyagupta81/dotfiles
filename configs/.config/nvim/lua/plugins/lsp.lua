return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"j-hui/fidget.nvim",
		"saghen/blink.cmp",
	},
	event = "LspAttach",
	config = function()
		local lspconfig = require("lspconfig")

		local capabilities = require("blink.cmp").get_lsp_capabilities()
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

		vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
		vim.keymap.set("n", "<leader>gd", "<cmd>FzfLua lsp_definitions<CR>")
		vim.keymap.set("n", "<leader>gr", "<cmd>FzfLua lsp_references<CR>")
		vim.keymap.set("n", "<leader>ca", "<cmd>FzfLua lsp_code_actions<CR>")
	end,
}
