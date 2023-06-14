local this = {}

this = {
    packer = {
        "nvim-neotest/neotest",
        requires = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-treesitter/nvim-treesitter" },
            { "antoinemadec/FixCursorHold.nvim" },
            {
                "alfaix/neotest-gtest",
                config = function()
                    require('neotest-gtest')
                end
            },
        },
        config = function()
            require("neotest").setup({
                adapters = {
                    require("neotest-gtest").setup({
                        is_test_file = function(file_path)
                            local Path = require("plenary.path")
                            local elems = vim.split(file_path, Path.path.sep, { plain = true })
                            local filename = elems[#elems]
                            if filename == "" then -- directory
                                return false
                            end
                            local extsplit = vim.split(filename, ".", { plain = true })
                            local extension = extsplit[#extsplit]
                            local fname_last_part = extsplit[#extsplit - 1]
                            local test_extensions = {
                                ["cpp"] = true,
                                ["cc"] = true,
                                ["cxx"] = true,
                                ["c++"] = true,
                            }
                            local result = test_extensions[extension]
                                and vim.endswith(fname_last_part, "unittest")
                                or false
                            return result
                        end,
                    })
                }
            })
        end,
    },
    which_map = {
        u = {
            r = { ":lua require('neotest').run.run()",'start unittest'},
            d = { ":lua require('neotest').run.run({strategy = 'dap'})",'debug unittest'},
            p = { "require('neotest').run.stop()", 'stop unittest'},
        }
    }
}

return this
