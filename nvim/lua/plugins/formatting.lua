return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				svelte = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettier" },
				liquid = { "prettier" },
				lua = { "stylua" },
				python = { "isort", "black" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>gf", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}

-- return {
-- 	"nvimtools/none-ls.nvim",
-- 	config = function()
-- 		local null_ls = require("null-ls")
-- 		null_ls.setup({
-- 			sources = {
-- 				null_ls.builtins.formatting.stylua,
-- 				null_ls.builtins.formatting.prettierd,
-- 				null_ls.builtins.formatting.prettier,
-- 				null_ls.builtins.formatting.black,
-- 				-- null_ls.builtins.formatting.eslint_d,
-- 			},
-- 		})
--
-- 		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
-- 	end,
-- }
