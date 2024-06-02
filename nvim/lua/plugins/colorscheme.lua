return {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
        require('catppuccin').setup({
            transparent_background = true,
        })
        vim.cmd.colorscheme "catppuccin-mocha"
    end
}

-- return{
--     'diegoulloao/neofusion.nvim',
--     name = 'neofusion',
--     priority = 1000,
--     config = function()
--         require('neofusion').setup({
--             transparent_mode = true
--         })
--         vim.cmd.colorscheme "neofusion"
--     end
-- }

-- return {
--   "rebelot/kanagawa.nvim",
--   name = "kanagawa",
--   priority = 1000,
--   config = function()
--     require("kanagawa").setup({
--       transparent = true,
--       colors = {
--         theme = {
--           all = {
--             ui = {
--               bg_gutter = "none",
--             },
--           },
--         },
--       },
--     })
--     vim.cmd("colorscheme kanagawa-wave")
--   end,
-- }
