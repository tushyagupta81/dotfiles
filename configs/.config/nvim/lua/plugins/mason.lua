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
					"lua_ls", -- lua
					"rust_analyzer", -- rust
					"ts_ls", -- typescript
					"emmet_language_server", -- emmet
					"emmet_ls", -- emmet
					"eslint", -- javascript
					"basedpyright", -- python
					"bashls", -- bash
					"tailwindcss", -- tailwind
				},
			})
			require("mason-tool-installer").setup({
				ensure_installed = {
					"prettier", -- js, ts & more formatter
					"stylua", -- lua formatter
					"ruff", -- python linter & formatter
					"biome", -- js & ts formatter
					"eslint_d", -- js formatter
					"clang-format", -- cpp & c formatter
					-- "rustfmt", -- rust
				},
			})
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		event = "VeryLazy",
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap",
		},
		opts = {
			handlers = {},
			ensure_installed = {
				"codelldb", -- c c++ rust zig
				"python", -- python
				"typescript", -- node
			},
		},
	},
}
