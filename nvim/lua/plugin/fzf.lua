return {
    packer = { 'ibhagwan/fzf-lua',
        requires = { 'vijaymarupudi/nvim-fzf', 'kyazdani42/nvim-web-devicons' },-- optional for icons
        opt = true,
        cmd = "FzfLua",
        -- module = 'fzf-lua',
    },
    which_map = {
        [' '] = {':FzfLua commands<cr>', 'use commands'},
        p = {
            name = "project",
            f = {":FzfLua files_resume<cr>", "find file in proect"},
            g = {":FzfLua git_files<cr>", "find file in proect"},
        },
    }
}
