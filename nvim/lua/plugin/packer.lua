return {
    packer = {'wbthomason/packer.nvim'},
    which_map = {
        v = {
            name = 'vim',
            u = {':PackerUpdate<CR>', 'update plugins'},
            i = {':PackerInstall<CR>', 'plugins install'},
            p = {':PackerProfile<CR>', 'profile packer time'},
            c = {':PackerCompile<CR>', 'plugins compile'},
            S = {':PackerStatus<CR>', 'show plugins state'},
        }
    }
}

