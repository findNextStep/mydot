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
                status_formatter =
                    function(status)
                        local added, changed, removed, head = status.added, status.changed, status.removed, status.head
                        local status_txt = {}
                        if added and added > 0 then table.insert(status_txt, ' ' .. added) end
                        if changed and changed > 0 then table.insert(status_txt, ' ' .. changed) end
                        if removed and removed > 0 then table.insert(status_txt, ' ' .. removed) end
                        if head then table.insert(status_txt, '' .. head) end
                        return table.concat(status_txt, ' ')
                    end,
                current_line_blame = true,
                current_line_blame_formatter_opts = {

                    relative_time = true
                },
            })
        end,
    },
    -- 应该绑定在<space>gn上
    next_hunk = function ()
        require('gitsigns').next_hunk()
        vim.cmd(":normal! zz")
        require('which-key').show(" g", {mode='n'})
    end,
    prev_hunk = function()
        require('gitsigns').prev_hunk()
        vim.cmd(":normal! zz")
        require('which-key').show(" g", {mode='n'})
    end,
    which_map = {
        g = {
            name = 'git',
            n = {':lua require(\'plugin.gitsigns\').next_hunk()<CR>' ,'next change'},
            N = {':lua require(\'plugin.gitsigns\').prev_hunk()<CR>' ,'next change'},
        },
    },
    line_item = {
        left = {
            {
                provider = function()
                    if vim.b.gitsigns_status_dict == nil then
                        return ""
                    end
                    if vim.b.gitsigns_status_dict.head == nil then
                        return ""
                    else
                        return ' '..vim.b.gitsigns_status_dict.head
                    end
                end,
            },
        },
        mid = {},
        right = {
            {
                provider = function()
                    if vim.b.gitsigns_status_dict == nil then
                        return ""
                    end
                    if vim.b.gitsigns_status_dict.added == nil then
                        return ""
                    else
                        return '  '..vim.b.gitsigns_status_dict.added
                    end
                end,
                hl = {
                    fg = '#86af7f'
                }
            },
            {
                provider = function()
                    if vim.b.gitsigns_status_dict == nil then
                        return ""
                    end
                    if vim.b.gitsigns_status_dict.changed == nil then
                        return ""
                    else
                        return '  '..vim.b.gitsigns_status_dict.changed
                    end
                end,
                hl = {
                    fg = '#ff8901'
                }
            },
            {
                provider = function()
                    if vim.b.gitsigns_status_dict == nil then
                        return ""
                    end
                    if vim.b.gitsigns_status_dict.removed == nil then
                        return ""
                    else
                        return '  '..vim.b.gitsigns_status_dict.removed
                    end
                end,
                hl = {
                    fg = '#e96962'
                }
            }
        },

    },
}

return module
