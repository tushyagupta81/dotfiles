return {
    'nvimdev/indentmini.nvim',
    event = 'BufEnter',
    config = function()
        require("indentmini").setup({
            char = "|",
            exclude = {
                "erlang",
                "markdown",
            }
        })

        -- Colors are applied automatically based on user-defined highlight groups.
        -- There is no default value.
        vim.cmd.highlight('IndentLine guifg=#123456')
    end
}
