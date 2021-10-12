return {
    packer = {
        'skywind3000/vim-terminal-help',
        fn = 'TerminalToggle',
        opt = true,
        config = function()
            vim.api.nvim_set_var("terminal_close", 1)
            vim.api.nvim_set_var("terminal_cwd",   2)
            vim.api.nvim_set_var('terminal_key', '<c-u>')
            vim.cmd('tmap <C-u> <c-\\><C-n>:call TerminalToggle()<cr>')
        end
    },
    which_map = {
        ['\''] = {':call TerminalToggle()<cr>','toggle terminal'},
    }
}
