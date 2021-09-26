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

    use { 'tomasiser/vim-code-dark', config =
        function ()
            vim.cmd[[colorscheme codedark]]
        end
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
        event = "BufRead",
        requires = {
            {"nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter"},
            {"p00f/nvim-ts-rainbow", after = "nvim-treesitter"},
            {"JoosepAlviste/nvim-ts-context-commentstring", after = "nvim-treesitter"}
        },
        config = function()
            vim.api.nvim_command("set foldmethod=expr")
            vim.api.nvim_command("set foldexpr=nvim_treesitter#foldexpr()")
            vim.o.foldlevel=100000
            require "nvim-treesitter.configs".setup {
                ensure_installed = "maintained",
                -- ensure_installed = "all",
                highlight = {
                    enable = true
                },
                indent = {
                    enable = true
                },
                rainbow = {
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
            local function check_back_space()
                local col = vim.fn.col('.') - 1
                if col == 0 then
                    return true
                end
                local last_char = vim.fn.getline('.')[col - 1]
                return last_char:gsub("%s", "") == ""
            end
            vimp.inoremap({'expr', 'silent'}, '<TAB>', function()
                if vim.fn.pumvisible() == 1 then
                    return "<c-n>"
                end
                if check_back_space() then
                    return "<TAB>"
                end
                return vim.fn.call("coc#refresh")
            end)
            vimp.inoremap({'expr', 'silent'}, '<S-TAB>', function()
                if vim.fn.pumvisible() == 1 then
                    return "<c-p>"
                else
                    return "<c-h>"
                end
            end)
        end
    }

    use { 'ibhagwan/fzf-lua',
        requires = {
            'vijaymarupudi/nvim-fzf',
            'kyazdani42/nvim-web-devicons' } -- optional for icons
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
                p = {
                    name = "project",
                    f = {":FzfLua files<cr>", "find file in proect"},
                },
            }
            which.register_keymap('leader',keymap);
        end,
    }

    use { 'lfv89/vim-interestingwords',
        opt= true,
        config=function()
        end
    }

    use { 'folke/zen-mode.nvim',
        config = function()
            require("zen-mode").setup {
                width = 0.85,
            }
        end
    }

    -- 测量启动时间
    use{ 'dstein64/vim-startuptime', opt=true, cmd='StartupTime' }

    use 'wbthomason/packer.nvim'
end)

