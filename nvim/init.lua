local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd 'packadd packer.nvim'
end

vim.o.ignorecase = true
vim.o.termguicolors = true
vim.o.smartcase = true
vim.o.incsearch = true
vim.o.hidden = true
vim.o.history = 5000
vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.shiftwidth = vim.o.tabstop
vim.o.colorcolumn = "120"
vim.g.mapleader = " "
vim.o.softtabstop = 4
vim.o.mouse = 'nv'
vim.o.guifont='DejaVuSansMono Nerd Font'

-- normal key map
local opts = {
        noremap = true,
        silent = false
    }
vim.keymap.set('n', '<leader>n', function()
    vim.wo.number = not vim.wo.number
end, { desc = 'show line number' })
-- Keep the cursor in place while joining lines
vim.keymap.set('n', 'J', 'mzJ`z', opts)
vim.keymap.set('i', 'jj', '<ESC>', opts)
-- we need better esc in android devices
vim.keymap.set('x', '<C-C>', '<ESC>', opts)
vim.keymap.set('x', '<C-c>', '<ESC>', opts)
vim.keymap.set('x', '<leader>y', '"*y', { desc = 'copy' })
vim.api.nvim_set_keymap('v', '<S-j>', ':m \'>+1<CR>gv=gv', opts)
vim.api.nvim_set_keymap('v', '<S-k>', ':m \'<-2<CR>gv=gv', opts)

PluginList = {
    'plugin.zen',
    'plugin.gitsigns',
    'plugin.coc',
    'plugin.interestingwords',
    'plugin.terminal',
    'plugin.telescope',
    'plugin.auto-session',
    'plugin.vim-startuptime',
    'plugin.packer',
    'plugin.nvim-luapad',
    'plugin.dap',
    'plugin.neotest',
}

local packer = require('packer')
packer.init({
    profile = {
        enable = true,
        threshold = 1,
    }
})

function MergeTable(table_1, table_2)
    for k,v in pairs(table_2) do
        if type(v) == "table" then
            if type(table_1[k] or false) == "table" then
                MergeTable(table_1[k] or {}, table_2[k] or {})
            else
                table_1[k] = v
            end
        else
            table_1[k] = v
        end
    end
    return table_1
end

function MergeArray(array_1, array_2)
    if array_2 ~= nil then
        for _,v in ipairs(array_2) do
            table.insert(array_1, v)
        end
    end
   return array_1
end

packer.startup(function(use)
    use { 'tomasiser/vim-code-dark',
        opt = true,
        event = "BufEnter",
        config =
            function ()
                vim.cmd[[colorscheme codedark]]
            end,
    }

    -- 缩进线插件
    use { "lukas-reineke/indent-blankline.nvim",
        config = function()
            vim.opt.list = true
            vim.opt.listchars:append("space:⋅")
            require("indent_blankline").setup {
                show_end_of_line = true,
                show_current_context = true,
                space_char_blankline = " ",
            }
        end,
    }

    -- 状态栏
    use { 'feline-nvim/feline.nvim',
        requires = {'kyazdani42/nvim-web-devicons'},
        config = function()
            local components = {
                active = {
                    {
                        {
                            provider = function() return require('feline.providers.vi_mode').get_vim_mode() end,
                            hl = function()
                                return {
                                    name = require('feline.providers.vi_mode').get_mode_highlight_name(),
                                    fg = require('feline.providers.vi_mode').get_mode_color(),
                                    style = 'bold'
                                }
                            end,
                            right_sep = ' ',
                            icon = '>'
                        },
                    },
                    {
                        {
                            provider = {
                                name = 'file_info',
                                opts = {
                                    type = 'uniuqe',
                                }
                            },
                        }
                    },
                    {}
                },
                inactive = {
                    {
                        {
                            provider = {
                                name = 'file_info',
                                opts = {
                                    type = 'relative',
                                }
                            },
                        },
                    },{},{}
                }
            }

            for _, plugin_name in ipairs(PluginList) do
                local r = require(plugin_name)
                if r.line_item ~= nil then
                    components.active[1] = MergeArray(components.active[1], r.line_item.left)
                    components.active[2] = MergeArray(components.active[2], r.line_item.mid)
                    components.active[3] = MergeArray(components.active[3], r.line_item.right)
                end
            end

            require('feline').setup({
                components = components,
                colors = {
                    bg = "#1e1e1e",
                    fg = "#c9d1d9",
                }
            })
            function _G.nvim_tabline()
                return require('feline').winbar.setup()
            end
            -- vim.o.tabline='%!v:lua.nvim_tabline()'
            vim.o.showtabline=2
        end
    }

    use {'norcalli/nvim-colorizer.lua',
        config = function() require('colorizer').setup()end,
        ft = { 'lua','vim','bash','zsh',},
        opt = true,
    }
    use 'Vonr/align.nvim'

    -- 高亮 主题
    use { "nvim-treesitter/nvim-treesitter",
        requires = {
            {"nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter"},
            {"JoosepAlviste/nvim-ts-context-commentstring", after = "nvim-treesitter"},
            {"lewis6991/spellsitter.nvim"},
            {"romgrk/nvim-treesitter-context"},
            {"nvim-treesitter/playground"},
            {
                "haringsrob/nvim_context_vt",
                config = function()
                    vim.api.nvim_set_hl(0, require('nvim_context_vt.config').default_opts.highlight, { fg = 0x505050 })
                end
            }
        },
        config = function()
            vim.opt.foldmethod = 'expr'
            vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
            vim.opt.foldenable = false
            require "nvim-treesitter.configs".setup {
                ensure_installed = {"cpp","lua","bash","python","go","vim"},
                -- ensure_installed = "all",
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false
                },
                -- indent = {
                --     enable = true
                -- },
                context_commentstring = {
                    enable = true
                },
                textobjects = {
                    select = {
                        enable = true,
                        keymaps = {
                            -- You can use the capture groups defined in textobjects.scm
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                            ["ac"] = "@class.outer",
                            ["ic"] = "@class.inner"
                        }
                    }
                }
            }
            require('spellsitter').setup()
            require'nvim_context_vt'.setup{
                highlight = 'ContextVt',
            }
            vim.api.nvim_set_hl(0, 'ContextVt', { fg = 0x404040})
        end,
        -- opt = true,
        -- event = "BufEnter"
    }

    use { 'folke/which-key.nvim',
        config = function ()
            local which = require("which-key")
            which.setup({
                spelling = {
                    enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
                    suggestions = 20, -- how many suggestions should be shown in the list?
                },
            })

            local keymap = {
                k = {"<CMD>call InterestingWords('n')<CR>" , "highlight words"},
                K = {"<CMD>call UncolorAllWords()<CR>" , "diable all highlight"},
                n = "switch numbers",
                c = 'comment',
                q = {
                    name = 'quit',
                    r = 'reload nvim config',
                },
                T = {
                    name = 'Toggle UI',
                },
                l = {
                    name="line",
                    c = "comment line",
                },
            }
            for _, plugin_name in ipairs(PluginList) do
                local r = require(plugin_name);
                if r.which_map then
                    keymap = MergeTable(keymap , r.which_map)
                end
            end

            which.register(keymap,{prefix = "<leader>"});
        end,
    }


    for _, plugin_name in ipairs(PluginList) do
        use (require(plugin_name).packer)
    end

    use { "terrortylor/nvim-comment",
        config = function()
            require('nvim_comment').setup({
                comment_empty = false,
                line_mapping = "<leader>lc",
                operator_mapping = "<leader>c"
            })
        end,
    }
    use('Bekaboo/dropbar.nvim')
end)

