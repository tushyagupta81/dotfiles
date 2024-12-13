return {
	"nvim-treesitter/nvim-treesitter",
	event = "VimEnter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			-- A list of parser names, or "all"
			ensure_installed = {
				"vimdoc",
				"javascript",
				"typescript",
				"c",
				"lua",
				"rust",
				"jsdoc",
				"bash",
				"html",
				"python",
				"cpp",
				"css",
				"fish",
				"gitignore",
				"http",
				"rust",
				"sql",
			},
			sync_install = false,
			auto_install = true,

			highlight = {
				enable = true,
				additional_vim_regex_highlighting = { "markdown" },
			},
		})
	end,
}
