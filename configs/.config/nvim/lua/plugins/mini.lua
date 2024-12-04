return { -- Collection of various small independent plugins/modules
	{
		"echasnovski/mini.nvim",
		event = "VeryLazy",
		version = "*",
		config = function()
			-- Better Around/Inside textobjects
			--
			-- Examples:
			--  - va)  - [V]isually select [A]round [)]paren
			--  - yinq - [Y]ank [I]nside [N]ext [']quote
			--  - ci'  - [C]hange [I]nside [']quote
			require("mini.ai").setup({ n_lines = 50 })

			-- Add/delete/replace surroundings (brackets, quotes, etc.)
			--
			-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
			-- - sd'   - [S]urround [D]elete [']quotes
			-- - sr)'  - [S]urround [R]eplace [)] [']
			require("mini.surround").setup()

			require("mini.cursorword").setup()

			require("mini.indentscope").setup({
				draw = {
					delay = 100,
					priority = 2,
					animation = function(s, n)
						return s / n * 20
					end,
				},
			})

			local hipatterns = require("mini.hipatterns")
			hipatterns.setup({
				highlighters = {
					-- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
					fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
					hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
					todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
					note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

					-- Highlight hex color strings (`#rrggbb`) using that color
					hex_color = hipatterns.gen_highlighter.hex_color(),

					hsl_color = {
						pattern = "hsl%(%d+,? %d+%%?,? %d+%%?%)",
						group = function(_, match)
							local utils = require("plugins.utils.hsl")
							--- @type string, string, string
							local nh, ns, nl = match:match("hsl%((%d+),? (%d+)%%?,? (%d+)%%?%)")
							--- @type number?, number?, number?
							local h, s, l = tonumber(nh), tonumber(ns), tonumber(nl)
							--- @type string
							---@diagnostic disable-next-line: param-type-mismatch
							local hex_color = utils.hslToHex(h, s, l)
							return hipatterns.compute_hex_color_group(hex_color, "bg")
						end,
					},
				},
			})

			require("mini.starter").setup()
		end,
	},
	{
		"echasnovski/mini.icons",
		opts = {},
		lazy = true,
		specs = {
			{
				"nvim-tree/nvim-web-devicons",
				enabled = false,
				optional = true,
			},
		},
		init = function()
			package.preload["nvim-web-devicons"] = function()
				require("mini.icons").mock_nvim_web_devicons()
				return package.loaded["nvim-web-devicons"]
			end
		end,
	},
}
