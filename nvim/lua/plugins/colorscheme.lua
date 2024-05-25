-- return {
--     'catppuccin/nvim',
--     name = 'catppuccin',
--     priority = 1000,
--     config = function()
--         require('catppuccin').setup({
--             transparent_background = true,
--         })
--         vim.cmd.colorscheme "catppuccin-mocha"
--     end
-- }

return{
    'diegoulloao/neofusion.nvim',
    name = 'neofusion',
    priority = 1000,
    config = function()
        require('neofusion').setup({
            transparent_mode = true
        })
        vim.cmd.colorscheme "neofusion"
    end
}
