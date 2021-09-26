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
            vimp.nnoremap('<leader>qr', function()
                vimp.unmap_all()
                vim.cmd('silent wa')
                require("config.util").unload_lua_namespace('config')
                dofile(vim.fn.stdpath('config') .. '/init.lua')
                vim.cmd('PackerCompile')
                print("Reloaded vimrc!")
            end)
        end
    }

    use { 'norcalli/nvim-colorizer.lua',
        config = function() require 'colorizer'.setup() end
    }

    use { 'tomasiser/vim-code-dark',
        config =
            function ()
                vim.cmd[[colorscheme codedark]]
            end,
        opt = true,
        event = 'VimEnter',
    }

    -- 缩进线插件
    use { "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("indent_blankline").setup {
                show_end_of_line = true,
                space_char_blankline = ">",
            }
        end
    }

    -- 状态栏
    use { 'famiu/feline.nvim',
        config = function()
            require('feline').setup()
        end
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
            local vimp = require('vimp')
            vim.o.hidden = true
            --local function check_back_space()
            --    local col = vim.fn.col('.') - 1
            --    if col == 0 then
            --        return true
            --    end
            --    local getline = vim.fn.getline('.')
            --    if getline == nil then
            --        return true
            --    end
            --    local last_char = getline[col - 1]
            --    return last_char == ""
            --    -- return last_char:gsub("%s", "") == ""
            --end
            vimp.inoremap({'expr', 'silent'}, '<TAB>', function()
                if vim.fn.pumvisible() == 1 then
                    return "<c-n>"
                end
                return "<TAB>"
                -- FIXME: call coc$refresh expect args
                -- if check_back_space() then
                --    return "<TAB>"
                -- end
                -- return vim.fn.call("coc#refresh()")
            end)
            vimp.inoremap({'expr', 'silent'}, '<S-TAB>', function()
                if vim.fn.pumvisible() == 1 then
                    return "<c-p>"
                else
                    return "<S-TAB>"
                end
            end)
        end,
    }

    use { 'ibhagwan/fzf-lua',
        requires = { 'vijaymarupudi/nvim-fzf', 'kyazdani42/nvim-web-devicons' },-- optional for icons
        opt = true,
        keys = {{'n', '<leader>pf'}}
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
            vim.g.which_key_timeout=20
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
                },
                e = {
                    name = 'edit',
                    c = {':split ~/.config/nvim/init.lua<cr>','edit config'},
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
                    f = {":FzfLua files<cr>", "find file in proect"},
                },
            }
            which.register_keymap('leader',keymap);
        end,
        opt = true,
        keys = {{'n', '<leader>'}},
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

    -- 颜色主题的luabind
    use { 'tjdevries/colorbuddy.nvim',
        config = function()
        end
    }

    use { "terrortylor/nvim-comment",
        config = function()
            require('nvim_comment').setup({
                comment_empty = false,
                line_mapping = "<leader>lc",
                operator_mapping = "<leader>c"
            })
        end,
        opt = true,
        keys = {
            {'n', '<leader>c'},
            {'n', '<leader>lc'}
        },
    }

    use { 'tversteeg/registers.nvim', keys = { { 'n', '"' }, { 'i', '<c-r>' } } }

    use { 'tversteeg/registers.nvim', keys = { { 'n', '"' }, { 'i', '<c-r>' } } }

    use 'wbthomason/packer.nvim'
end)

