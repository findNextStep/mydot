local module = {
    packer = {
        'neoclide/coc.nvim',
        requires = {
            'rafcamlet/coc-nvim-lua',
            'clangd/coc-clangd',
            'josa42/coc-go',
        },
        branch = 'release',
        config = function ()
            -- key bind
            local vimp = require('vimp')
            vim.o.hidden = true
            vimp.inoremap({'expr', 'silent'}, '<TAB>', function()
                if vim.fn.pumvisible() == 1 then
                    return "<c-n>"
                end
                return "<TAB>"
            end)
            vimp.inoremap({'expr', 'silent'}, '<S-TAB>', function()
                if vim.fn.pumvisible() == 1 then
                    return "<c-p>"
                else
                    return "<S-TAB>"
                end
            end)
            -- color highlight
            local Color, colors, Group, _, styles = require('colorbuddy').setup()
            Color.new('parameter','#306b72')
            Group.new('CocSem_parameter',colors.parameter)
            Color.new('type','#729de3')
            Group.new('CocSem_class', colors.type, nil, styles.bold)
            Group.new('CocSem_type', colors.type, nil, styles.bold)
            Group.new('CocSem_typeParameter', colors.type, nil, styles.bold)
            Group.new('CocSem_enum', colors.type, nil, styles.bold)
            Color.new('functions','#e5b124')
            Group.new('CocSem_function', colors.functions)
            Group.new('CocSem_method', colors.functions, nil, styles.underline)
            Color.new('variable','#26cdca')
            Group.new('CocSem_variable', colors.variable)
            Color.new('enumMember','#397797')
            Group.new('CocSem_enumMember', colors.enumMember, nil, styles.bold)
            Color.new('macro','#8f5daf')
            Group.new('CocSem_macro', colors.macro, nil, styles.bold)
            Color.new('comment','#505050')
            Group.new('CocSem_comment', colors.comment)
            Color.new('namespace','#00d780')
            Group.new('CocSem_namespace', colors.namespace, nil, styles.bold)
            Color.new('property','#7ca6b7')
            Group.new('CocSem_property', colors.property, nil, styles.underline)
        end,
        opt = true,
        event = 'VimEnter',
    },
    next_warning = function()
        vim.cmd(':call CocAction(\'diagnosticNext\')')
        vim.cmd(":normal! zz")
        require('which-key').show(" sw",{mode = 'n'})
    end,
    prev_warning = function()
        vim.cmd(':call CocAction(\'diagnosticPrevious\')')
        vim.cmd(":normal! zz")
        require('which-key').show(" sw",{mode = 'n'})
    end,
    next_error = function()
        vim.cmd(':call CocAction(\'diagnosticNext\',\'error\')')
        vim.cmd(":normal! zz")
        require('which-key').show(" sE",{mode = 'n'})
    end,
    prev_error = function()
        vim.cmd(':call CocAction(\'diagnosticPrevious\',\'error\')')
        vim.cmd(":normal! zz")
        require('which-key').show(" sE",{mode = 'n'})
    end,
    which_map = {
        s = {
            name = "search / symbol",
            e = {"<Plug>(coc-rename)", "edit symbol"},
            d = {"<Plug>(coc-definition)", "go define"},
            r = {"<Plug>(coc-references)", "go reference"},
            a = {':CocAction<CR>', 'code action'},
            j = {':CocList outline<CR>','symbol in buffer'},
            w = {
                name = 'warning',
                n = {':lua require(\'plugin.coc\').next_warning()<CR>' ,'next warning'},
                N = {':lua require(\'plugin.coc\').prev_warning()<CR>' ,'prev warning'},
            },
            E = {
                name = 'error',
                n = {':lua require(\'plugin.coc\').next_error()<CR>' ,'next error'},
                N = {':lua require(\'plugin.coc\').prev_error()<CR>' ,'prev error'},
            },
            [' '] = {':CocList commands<CR>', 'coc commands'},
        },
        j = {
            name = 'jump/join/split',
            i = {':CocList outline<CR>','symbol in buffer'},
        },
    },
    line_item = {
        left = {},
        mid = {},
        right = {
            {
                provider = function()
                    if vim.fn['coc#status'] == nil then
                        return ''
                    end
                    return vim.fn['coc#status']()
                end
            }
        },
    }
}

return module

