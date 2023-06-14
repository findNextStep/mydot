local os= require('ffi').os:lower()

local this = {}
this = {
    packer = {
        'mfussenegger/nvim-dap',
        requires = {
            -- ui for dap
            {
                'rcarriga/nvim-dap-ui'
            },
            -- about cmake config
            {
                'Shatur/neovim-tasks',
                config = function()
                    local Path = require('plenary.path')
                    require('tasks').setup({
                        default_params = {
                            -- Default module parameters with which `neovim.json` will be created.
                            cmake = {
                                cmd = 'cmake',
                                -- CMake executable to use, can be changed using `:Task set_module_param cmake cmd`.
                                build_dir = tostring(Path:new('{cwd}', 'build')),
                                -- Build directory. The expressions `{cwd}`, `{os}` and `{build_type}` will be expanded with the corresponding text values. Could be a function that return the path to the build directory.
                                build_type = 'Debug',
                                -- Build type, can be changed using `:Task set_module_param cmake build_type`.
                                dap_name = 'lldb',
                                -- DAP configuration name from `require('dap').configurations`. If there is no such configuration, a new one with this name as `type` will be created.
                                args = {
                                    -- Task default arguments.
                                    configure = {
                                        '-DCMAKE_CXX_COMPILER_LAUNCHER=ccache',
                                        '-DCMAKE_C_COMPILER_LAUNCHER=ccache',
                                        '-DCMAKE_EXPORT_COMPILE_COMMANDS=1',
                                        '-G', 'Ninja'
                                    },
                                },
                            },
                        },
                    })
                end
            }
        },
        config = function()
            local dap = require('dap')
            -- config for lldb see https://github.com/mfussenegger/nvim-dap/discussions/158
            -- local runner = require('neotest-gtest.runner')
            -- runner.Runner._executable_path = {require('plugin.dap').get_current_executable_path()}
            dap.adapters.lldb = {
                type = 'executable',
                -- use default lldb
                command = '/usr/local/Cellar/llvm/15.0.7_1/bin/lldb-vscode',
                name = 'lldb'
            }
            dap.configurations.cpp = {
                {
                    name = "Launch",
                    type = "lldb",
                    request = "launch",
                    program = function()
                        return require('plugin.dap').get_current_executable_path()
                    end,
                    cwd = '${workspaceFolder}',
                    stopOnEntry = false,
                    args = {},
                    runInTerminal = true,
                },
            }
        end
    },
    parse_dir = function(dir, build_type)
        local Path = require('plenary.path')
        local parsed_dir = dir:gsub('{cwd}', vim.loop.cwd())
        parsed_dir = parsed_dir:gsub('{os}', os)
        parsed_dir = parsed_dir:gsub('{build_type}', build_type:lower())
        return Path:new(parsed_dir)
    end,
    get_reply_dir = function(build_dir) return build_dir / '.cmake' / 'api' / 'v1' / 'reply' end,
    get_target_info = function(codemodel_target, reply_dir) return vim.json.decode((reply_dir / codemodel_target['jsonFile']):read()) end,
    get_codemodel_targets = function(reply_dir)
        local utils = require('tasks.utils')
        local Path = require('plenary.path')
        local scandir = require('plenary.scandir')
        local found_files = scandir.scan_dir(reply_dir.filename, { search_pattern = 'codemodel*' })
        if #found_files == 0 then
            utils.notify('Unable to find codemodel file', vim.log.levels.ERROR)
            return nil
        end
        local codemodel = Path:new(found_files[1])
        local codemodel_json = vim.json.decode(codemodel:read())
        return codemodel_json['configurations'][1]['targets']
    end,
    --- Finds path to an executable.
    ---@param build_dir table
    ---@param name string
    ---@param reply_dir table
    ---@return unknown?
    get_executable_path = function(build_dir, name, reply_dir)
        local utils = require('tasks.utils')
        local Path = require('plenary.path')
        local dir = this.get_codemodel_targets(reply_dir)
        if dir == nil then
            return nil
        end
        for _, target in ipairs(dir) do
            if name == target['name'] then
                local target_info = this.get_target_info(target, reply_dir)
                if target_info['type'] ~= 'EXECUTABLE' then
                    utils.notify(string.format('Specified target "%s" is not an executable', name), vim.log.levels.ERROR)
                    return nil
                end

                local target_path = Path:new(target_info['artifacts'][1]['path'])
                if not target_path:is_absolute() then
                    target_path = build_dir / target_path
                end

                return target_path
            end
        end

        utils.notify(string.format('Unable to find target named "%s"', name), vim.log.levels.ERROR)
        return nil
    end,
    get_current_executable_path = function()
        local pc = require('tasks.project_config')
        local c = pc.new()
        local build = this.parse_dir(c.cmake.build_dir, c.cmake.build_type)
        local exe_path = this.get_executable_path(build, c.cmake.target, this.get_reply_dir(build))
        if exe_path == nil then
            return nil
        end
        return exe_path.filename
    end,
    which_map = {},

}
return this
