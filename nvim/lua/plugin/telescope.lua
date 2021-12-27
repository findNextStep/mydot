return {
    packer = {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} },
        opt = true,
        cmd = 'Telescope',
    },

    which_map = {
        [' '] = {':Telescope  commands<cr>', 'use commands'},
        s = {
            s = {':Telescope current_buffer_fuzzy_find<cr>', 'find line'},
        },
        j = {
            name = 'jump/join/split',
            i = {':Telescope treesitter<cr>', 'go symbol in buffer'},
        },
        p = {
            name = "project",
            f = {":Telescope find_files<cr>", "find file in proect"},
            g = {":Telescope git_files<cr>", "find file in proect"},
            p = {'"*p', "paste"},
        },
    }
}
