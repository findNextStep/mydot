return {
    packer = {
        'dstein64/vim-startuptime',
        opt=true,
        cmd='StartupTime',
    },
    which_map = {
        v = {
            name = 'vim',
            s = {':StartupTime<CR>', 'show start up time profile'}
        }
    }
}
