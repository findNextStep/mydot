return {
    packer = {
        'rafcamlet/nvim-luapad',
        config = function()
            require('luapad').setup({})
        end,
    },
    which_map = {
        v = {
            t = {':Luapad <CR>', 'lua play ground' },
        }
    }
}
