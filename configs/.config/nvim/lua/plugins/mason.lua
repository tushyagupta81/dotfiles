return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"rust_analyzer",
					"ts_ls",
					"emmet_language_server",
					"eslint",
					"pyright",
					"emmet_ls",
					"bashls",
					"tailwindcss",
					-- "ast_grep",
				},
			})
			require("mason-tool-installer").setup({
				ensure_installed = {
					"prettier", -- prettier formatter
					"stylua", -- lua formatter
					"isort", -- python formatter
					"black", -- python formatter
					"ruff", -- python linter
					"flake8", -- python linter
					"biome",
					"eslint_d",
					"clang-format",
					-- "rustfmt",
				},
			})
		end,
	},
}
