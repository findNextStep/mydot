return {
    packer = {
        'folke/zen-mode.nvim',
        config = function()
            require("zen-mode").setup {
                width = 0.85,
            }
        end,
        opt = true,
        cmd = "ZenMode",
    },

    which_map = {
        T = {
            z = {':ZenMode<CR>', 'toggle zen mode<CR>'}
        },
    }
}
