local module = {
    packer = {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
        },
        -- tag = 'release',-- To use the latest release
        config = function()
            require('gitsigns').setup({
                signcolumn = false,
                numhl = true,
                current_line_blame = true,
            })
        end,
    },
    -- 应该绑定在<space>gn上
    next_hunk = function ()
        require('gitsigns').next_hunk()
        vim.cmd(":normal zz")
        require('which-key').show(" g", {mode='n'})
    end,
    which_map = {
        g = {
            name = 'git',
            n = {':lua require(\'plugin.gitsigns\').next_hunk()<CR>' ,'next change'},
        },
    },
}

return module

