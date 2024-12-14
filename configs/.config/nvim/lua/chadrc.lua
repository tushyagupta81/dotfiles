local M = {}

M.base46 = {
	theme = "monekai", -- "doomchad" ""chadracula" "monekai" "gatekeeper" "kanagawa" "gruvbox" "flexoki" "mito-laser" "nightowl" "solarized_dark" "tokyodark"
	transparency = true,
  hl_override = {
    CursorLine = {
      bg = "one_bg"
    }
  },
}

M.ui = {
	statusline = {
		theme = "minimal", -- default/vscode/vscode_colored/minimal
		-- default/round/block/arrow separators work only for default statusline theme
		-- round and block will work for minimal theme only
		separator_style = "block",
		order = nil,
		modules = nil,
	},

	cmp = {
		lspkind_text = true,
		icons = true,
		icons_left = true,
		style = "default", -- default/flat_light/flat_dark/atom/atom_colored
		format_colors = {
			tailwind = true,
		},
	},

	tabufline = {
		enabled = false,
		order = { "buffers" },
		modules = nil,
	},
}

M.colorify = {
	enabled = true,
	mode = "virtual", -- fg, bg, virtual
	-- virt_text = "󱓻 ",
	virt_text = " ",
	highlight = {
		hex = true,
		lspvars = true,
	},
}

M.lsp = {
	signature = true,
}

return M
