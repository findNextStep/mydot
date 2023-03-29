local module = {
    packer = {
        'neoclide/coc.nvim',
        requires = {
            'rafcamlet/coc-nvim-lua',
            'clangd/coc-clangd',
            'josa42/coc-go',
            'iamcco/coc-spell-checker',
        },
        branch = 'release',
        config = function ()
            -- key bind
            vim.o.hidden = true
            vim.api.nvim_set_keymap('x', '<leader>f', "<Plug>(coc-format-selected)", { noremap = false })
            local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
            vim.keymap.set('i', '`', function()
                return vim.fn['coc#pum#next'](1)
            end, opts)
            vim.keymap.set("i", "<Tab>",
                function()
                    if vim.fn['coc#pum#visible']() == 1 then
                        return vim.fn['coc#pum#next'](1)
                    end
                    if require('plugin.coc').check_back_space() then
                        return vim.fn['coc#refresh']()
                    end
                    return "<Tab>"
                end
                , { noremap = true, expr = true })
            vim.keymap.set("i", "<S-Tab>", function()
                if vim.fn['coc#pum#visible']() == 1 then
                    return vim.fn['coc#pum#prev'](1)
                end
                return "<S-Tab>"
            end, opts)
            vim.keymap.set("i", "<CR>", function()
                if vim.fn['coc#pum#visible']() == 1 then
                    return vim.fn['coc#pum#confirm']();
                end
                return "\r"
            end, opts)
            -- color highlight
            vim.api.nvim_set_hl(0, "@parameter", { fg = 0x306b72 });
            vim.api.nvim_set_hl(0, "@type", { fg = 0x729de3 });
            vim.api.nvim_set_hl(0, "@function", { fg = 0xe5b124 });
            vim.api.nvim_set_hl(0, "@variable", { fg = 0x26cdca });
            vim.api.nvim_set_hl(0, "CocSemComment", { fg = 0x505050 });
            vim.api.nvim_set_hl(0, "CocSemClass", { fg = 0x729de3, bold = true });
            vim.api.nvim_set_hl(0, "CocSemEnum", { fg = 0x397797, bold = true });
            vim.api.nvim_set_hl(0, "CocSemEnumMember", { fg = 0x397797, bold = true });
            vim.api.nvim_set_hl(0, "CocSemStruct", { fg = 0x729de3 });
            vim.api.nvim_set_hl(0, "CocSemMethod", { fg = 0xe5b124, underline = true });
            vim.api.nvim_set_hl(0, "CocSemProperty", { fg = 0x7ca6b7, underline = true });
            vim.api.nvim_set_hl(0, "CocSemMacro", { fg = 0x8f5daf, bold = true });
            vim.api.nvim_set_hl(0, "CocSemNamespace", { fg = 0x00d780, bold = true });
        end,
        opt = true,
        event = "BufEnter"
    },
    check_back_space = function()
        local col = vim.fn.col('.') - 1
        return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
    end,
    next_warning = function()
        vim.cmd(':call CocAction(\'diagnosticNext\')')
        vim.cmd(":normal! zz")
        require('which-key').show(" ew",{mode = 'n'})
    end,
    prev_warning = function()
        vim.cmd(':call CocAction(\'diagnosticPrevious\')')
        vim.cmd(":normal! zz")
        require('which-key').show(" ew",{mode = 'n'})
    end,
    next_error = function()
        vim.cmd(':call CocAction(\'diagnosticNext\',\'error\')')
        vim.cmd(":normal! zz")
        require('which-key').show(" e",{mode = 'n'})
    end,
    prev_error = function()
        vim.cmd(':call CocAction(\'diagnosticPrevious\',\'error\')')
        vim.cmd(":normal! zz")
        require('which-key').show(" e",{mode = 'n'})
    end,
    which_map = {
        s = {
            name = "search / symbol",
            a = {':CocAction<CR>', 'code action'},
            b = {':call CocAction(\'showOutline\')<cr>', 'show tag in current buffer'},
            c = {':call CocAction(\'showIncomingCalls\')<cr>','show call hierarchy'},
            d = {"<Plug>(coc-definition)", "go define"},
            e = {"<Plug>(coc-rename)", "edit symbol"},
            h = {':call CocActionAsync(\'doHover\')<CR>', 'show hover'},
            j = {':CocList outline<CR>','symbol in buffer'},
            r = {"<Plug>(coc-references)", "go reference"},
            [' '] = {':CocList commands<CR>', 'coc commands'},
            f = {":CocCommand semanticTokens.inspect<CR>","show token"},
        },
        e = {
            name = 'errors',
            w = {
                name = 'warning',
                n = {':lua require(\'plugin.coc\').next_warning()<CR>' ,'next warning'},
                N = {':lua require(\'plugin.coc\').prev_warning()<CR>' ,'prev warning'},
            },
            l = {':CocList diagnostics' , 'list error'},
            n = {':lua require(\'plugin.coc\').next_error()<CR>' ,'next error'},
            N = {':lua require(\'plugin.coc\').prev_error()<CR>' ,'prev error'},
        },
        f = {'<Plug>(coc-format-selected)', 'coc format'},
    },
    line_item = {
        left = {
            {
                provider = function ()
                    if vim.b.coc_diagnostic_info == nil then
                        return ''
                    elseif vim.b.coc_diagnostic_info.error == 0 then
                        return ''
                    else
                        return '  '..tostring(vim.b.coc_diagnostic_info.error)
                    end
                end,
                hl = {
                    fg = '#e96962'
                },
            },
            {
                provider = function ()
                    if vim.b.coc_diagnostic_info == nil then
                        return ''
                    elseif vim.b.coc_diagnostic_info.warning == 0 then
                        return ''
                    else
                        return '  '..tostring(vim.b.coc_diagnostic_info.warning)
                    end
                end,
                hl = {
                    fg = '#ff8901'
                },
            },
            {
                provider = function ()
                    if vim.b.coc_diagnostic_info == nil then
                        return ''
                    elseif vim.b.coc_diagnostic_info.information == 0 then
                        return ''
                    else
                        return '  '..tostring(vim.b.coc_diagnostic_info.information)
                    end
                end,
                hl = {
                    fg = '#65a7b9'
                },
            },
            {
                provider = function ()
                    if vim.b.coc_diagnostic_info == nil then
                        return ''
                    elseif vim.b.coc_diagnostic_info.hint == 0 then
                        return ''
                    else
                        return '  '..tostring(vim.b.coc_diagnostic_info.hint)
                    end
                end,
                hl = {
                    fg = '#00acc1'
                },
            },
        },
        mid = {},
        right = {
            {
                provider = function()
                    if vim.g.coc_status == nil then
                        return ''
                    end
                    if string.len(vim.g.coc_status) == 0 then
                        return ''
                    end
                    local status = string.gsub(vim.g.coc_status, "%%", "%%%%")
                    return status
                end,
            }
        },
    }
}

return module

