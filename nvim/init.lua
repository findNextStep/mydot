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

PluginList = {
    'plugin.zen',
    'plugin.gitsigns',
    'plugin.coc',
    'plugin.interestingwords',
    'plugin.terminal',
    'plugin.fzf',
}

local packer = require('packer')
packer.init({
    profile = {
        enable = true,
        threshold = 1,
    }
})

function MergeTable(t1, t2)
    for k,v in pairs(t2) do
        if type(v) == "table" then
            if type(t1[k] or false) == "table" then
                MergeTable(t1[k] or {}, t2[k] or {})
            else
                t1[k] = v
            end
        else
            t1[k] = v
        end
    end
    return t1
end

function MergeArray(t1, t2)
   for _,v in ipairs(t2) do
      table.insert(t1, v)
   end
   return t1
end

packer.startup(function(use)
    use { 'tjdevries/colorbuddy.nvim',
        opt = true,
        module = 'colorbuddy',
    }

    use { 'svermeulen/vimpeccable',
        config = function ()
            local vimp = require('vimp')
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
            vim.opt.list = true
            vim.opt.listchars = {
                space = '⋅',
            }

            require("indent_blankline").setup {
                show_end_of_line = true,
                show_current_context = true,
                space_char_blankline = " ",
            }
        end,
    }

    -- 状态栏
    use { 'famiu/feline.nvim',
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
                                    bg = require('feline.providers.vi_mode').get_mode_color(),
                                    fg = 'White',
                                    style = 'bold'
                                }
                            end,
                            right_sep = ' ',
                            icon = '>'
                        },
                        {
                            provider = {
                                name = 'file_info',
                                opts = {
                                    type = 'uniuqe',
                                }
                            },
                        },
                    },
                    {}
                },
                inactive = {}
            }

            for _, plugin_name in ipairs(PluginList) do
                local r = require(plugin_name)
                if r.line_item ~= nil then
                    components.active[1] = MergeArray(components.active[1], r.line_item.left)
                    components.active[2] = MergeArray(components.active[2], r.line_item.right)
                end
            end

            require('feline').setup({
                components = components,
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

    use 'wbthomason/packer.nvim'
end)

