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
vim.opt.list = true
vim.opt.listchars = {
    space = "⋅",
}

local packer = require('packer')
packer.init({
    profile = {
        enable = true,
        threshold = 1,
    }
})

packer.startup(function(use)
    use { 'tjdevries/colorbuddy.nvim',
        opt = true,
        module = 'colorbuddy',
    }

    use { 'svermeulen/vimpeccable',
        config = function ()
            local vimp = require('vimp')
            vimp.nnoremap('<leader>hw', function()
                print('hello')
                print('world')
            end)
            vimp.bind('n', '<leader>n', function ()
                vim.wo.number = not vim.wo.number
            end)
            -- Keep the cursor in place while joining lines
            vimp.nnoremap('J', 'mzJ`z')
            vimp.inoremap('jj','<ESC>')
            -- we need better esc in android devices
            vimp.xnoremap('<C-C>', '<ESC>')
            vimp.onoremap('<C-c>', '<ESC>')
            vimp.inoremap('<C-c>', '<ESC>')
            vimp.cnoremap('<C-c>', '<ESC>')
            vimp.tnoremap('<C-c>', '<ESC>')
            vimp.nnoremap('<C-c>', '<ESC>')
            vimp.nnoremap('<leader>qr', function()
                vimp.unmap_all()
                vim.cmd('silent wa')
                require("config.util").unload_lua_namespace('config')
                dofile(vim.fn.stdpath('config') .. '/init.lua')
                vim.cmd('PackerCompile')
                print("Reloaded vimrc!")
            end)
        end,
        opt = true,
        module = 'vimp',
    }

    use { 'tomasiser/vim-code-dark',
        config =
            function ()
                vim.cmd[[colorscheme codedark]]
            end,
    }

    -- 缩进线插件
    use { "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("indent_blankline").setup {
                show_end_of_line = true,
                space_char_blankline = ">",
            }
        end,
    }

     -- show git
    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        },
        tag = 'release',-- To use the latest release
        config = function()
            require('gitsigns').setup({
                signcolumn = false,
                numhl = true,
                current_line_blame = true,
            })
        end,
        opt = true,
        event = 'BufWinEnter',
        cmd = 'Gitsigns',
    }

    -- 状态栏
    use { 'famiu/feline.nvim',
        requires = {'kyazdani42/nvim-web-devicons'},
        config = function()
            require('feline').setup({
                components = {
                    active = {
                        {
                            {
                                provider = function() return require('feline.providers.vi_mode').get_vim_mode() end,
                                hl = function()
                                    return {
                                        name = require('feline.providers.vi_mode').get_mode_highlight_name(),
                                        bg = require('feline.providers.vi_mode').get_mode_color(),
                                        fg = 'White',
                                        style = 'bold'
                                    }
                                end,
                                right_sep = ' ',
                                icon = '>'
                            },
                            {
                                provider = function (winid,component)
                                    return require('feline.providers.file').file_info(winid,component,'short-path')
                                end,
                            },
                        },
                    },
                    inactive = {
                    }
                },
            })
        end
    }

    use {'norcalli/nvim-colorizer.lua',
        config = function() require('colorizer').setup()end,
        ft = { 'lua','vim','bash','zsh',},
        opt = true,
    }

    -- 高亮 主题
    use { "nvim-treesitter/nvim-treesitter",
        ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'lua', 'vim', 'python', 'go'},
        requires = {
            {"nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter"},
            {"JoosepAlviste/nvim-ts-context-commentstring", after = "nvim-treesitter"}
        },
        config = function()
            vim.api.nvim_command("set foldmethod=expr")
            vim.api.nvim_command("set foldexpr=nvim_treesitter#foldexpr()")
            vim.o.foldlevel=100000
            require "nvim-treesitter.configs".setup {
                ensure_installed = {"cpp","lua","bash","python","go"},
                -- ensure_installed = "all",
                highlight = {
                    enable = true
                },
                indent = {
                    enable = true
                },
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
        end
    }

    -- coc nvim lsp support
    use { 'neoclide/coc.nvim',
        branch='release',
        requires = {'rafcamlet/coc-nvim-lua'},
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
    }

    use { 'ibhagwan/fzf-lua',
        requires = { 'vijaymarupudi/nvim-fzf', 'kyazdani42/nvim-web-devicons' },-- optional for icons
        opt = true,
        cmd = "FzfLua",
        module = 'fzf-lua',
    }

    use { 'AckslD/nvim-whichkey-setup.lua',
        requires = {'liuchengxu/vim-which-key'},
        config = function ()
            local which = require("whichkey_setup")
            which.config{
                hide_statusline = true,
                default_keymap_settings = {
                    noremap=false,
                }
            }
            local keymap = {
                k = {"<CMD>call InterestingWords('n')<CR>" , "highlight words"},
                K = {"<CMD>call UncolorAllWords()<CR>" , "diable all highlight"},
                n = "switch numbers",
                c = 'comment',
                s = {
                    name = "search / symbol",
                    e = {"<Plug>(coc-rename)", "edit symbol"},
                    d = {"<Plug>(coc-definition)", "go define"},
                    r = {"<Plug>(coc-references)", "go reference"},
                    j = {':CocList outline<CR>','symbol in buffer'},
                },
                e = {
                    name = 'edit',
                    c = {':split ~/.config/nvim/init.lua<cr>','edit config'},
                },
                j = {
                    name = 'jump/join/split',
                    i = {':CocList outline<CR>','symbol in buffer'},
                },
                q = {
                    name = 'quit',
                    r = 'reload nvim config',
                },
                T = {
                    name = 'Toggle UI',
                    z = {':ZenMode<CR>', 'toggle zen mode<CR>'}
                },
                l = {
                    name="line",
                    c = "comment line",
                },
                p = {
                    name = "project",
                    f = {":lua require('fzf-lua').files_resume()<cr>", "find file in proect"},
                    g = {":lua require('fzf-lua').git_files()<cr>", "find file in proect"},
                },
            }
            which.register_keymap('leader',keymap);
        end,
    }

    use { 'lfv89/vim-interestingwords',
        opt= true,
        fn = "InterestingWords",
        config=function()
        end
    }

    use { 'folke/zen-mode.nvim',
        config = function()
            require("zen-mode").setup {
                width = 0.85,
            }
        end,
        opt = true,
        cmd = "ZenMode",
    }

    -- 测量启动时间
    use{ 'dstein64/vim-startuptime', opt=true, cmd='StartupTime' }

    use { "terrortylor/nvim-comment",
        config = function()
            require('nvim_comment').setup({
                comment_empty = false,
                line_mapping = "<leader>lc",
                operator_mapping = "<leader>c"
            })
        end,
    }

    use { 'tversteeg/registers.nvim', keys = { { 'n', '"' }, { 'i', '<c-r>' } } }

    use 'wbthomason/packer.nvim'
end)

