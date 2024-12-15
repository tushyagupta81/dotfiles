-- put this in your main init.lua file ( before lazy setup )
vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46_cache/"

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
---@diagnostic disable-next-line: undefined-field
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("set")
require("remaps")

require("lazy").setup({
	-- importing directories
	spec = {
		{ import = "plugins" },
		-- { import = "plugins.lsp" },
	},

	-- ui config
	ui = {
		border = "rounded",
		size = {
			width = 0.8,
			height = 0.8,
		},
	},
})

dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")
dofile(vim.g.base46_cache .. "syntax")
dofile(vim.g.base46_cache .. "treesitter")
dofile(vim.g.base46_cache .. "cmp")
dofile(vim.g.base46_cache .. "telescope")
dofile(vim.g.base46_cache .. "tbline")
dofile(vim.g.base46_cache .. "lsp")

-- for _, v in ipairs(vim.fn.readdir(vim.g.base46_cache)) do
-- 	dofile(vim.g.base46_cache .. v)
-- end
