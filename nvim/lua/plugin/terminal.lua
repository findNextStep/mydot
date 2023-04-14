return {
    packer = {
        'skywind3000/vim-terminal-help',
        opt = true,
        event = "BufEnter",
        config = function()
            local function t(str)
                return vim.api.nvim_replace_termcodes(str, true, true, true)
            end
            vim.api.nvim_set_var("terminal_close", 1)
            vim.api.nvim_set_var("terminal_cwd",   2)
            vim.api.nvim_set_var('terminal_key', '<c-i>')
            vim.api.nvim_set_keymap('t', 'jj', '<c-\\><c-n>', {})
            vim.api.nvim_set_keymap('i', t'<C-i>', ':call TerminalToggle()<cr>', {})
            vim.api.nvim_set_keymap('n', t'<C-i>', ':call TerminalToggle()<cr>', {})
        end
    },
    which_map = {
        ['\''] = {':call TerminalToggle()<cr>','toggle terminal'},
    }
}
