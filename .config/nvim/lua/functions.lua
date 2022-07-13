local entry_display = require "telescope.pickers.entry_display"
local actions = require "telescope.actions" -- local action_set = require "telescope.actions.set"
-- local action_state = require "telescope.actions.state"
local finders = require "telescope.finders"
-- local make_entry = require "telescope.make_entry"
-- local Path = require "plenary.path"
local pickers = require "telescope.pickers"
-- local previewers = require "telescope.previewers"
-- local p_window = require "telescope.pickers.window"
local sorters = require "telescope.sorters"
-- local state = require "telescope.state"
-- local utils = require "telescope.utils"

M = {}

M.registers = function()
    local register_sorter = function()
        return sorters.Sorter:new {
            scoring_function = function(_, prompt, line)
                return require "telescope.algos.string_distance"(prompt, line)
            end
        }
    end

    local make_entry_gen_from_registers = function(_)
        local displayer =
            entry_display.create {
            separator = " ",
            hl_chars = {["["] = "TelescopeBorder", ["]"] = "TelescopeBorder"},
            items = {
                {width = 3},
                {remaining = true}
            }
        }

        local make_display = function(entry)
            local content = entry.content
            return displayer {
                {"[" .. entry.value .. "]", "TelescopeResultsNumber"},
                type(content) == "string" and content:gsub("\n", "\\n") or content
            }
        end

        return function(entry)
            return {
                valid = true,
                value = entry,
                ordinal = vim.fn.getreg(entry),
                content = vim.fn.getreg(entry),
                display = make_display
            }
        end
    end

    local opts = require "telescope.themes".get_ivy()

    local registers_table = {'"', "_", "#", "=", "_", "/", "*", "+", ":", ".", "%"}

    -- named
    for i = 0, 9 do
        table.insert(registers_table, tostring(i))
    end

    -- alphabetical
    for i = 65, 90 do
        table.insert(registers_table, string.char(i))
    end
    opts = opts
    pickers.new(
        opts,
        {
            prompt_title = "Registers",
            finder = finders.new_table {
                results = registers_table,
                entry_maker = make_entry_gen_from_registers(opts)
            },
            -- use levenshtein as n-gram doesn't support <2 char matches
            sorter = register_sorter(),
            attach_mappings = function(_, map)
                actions.select_default:replace(actions.paste_register)
                map("i", "<C-e>", actions.edit_register)

                return true
            end
        }
    ):find()
end

M.find_nvim_configs = function()
    local opts = {
        cwd = vim.g.nvim_dir
        -- find_files = "rg"
    }
    require("telescope.builtin").find_files(opts)
end

M.all_configs = function()
    local opts = {
        cwd = "/home/tusqasi/",
        -- find_files = "rg",
        search_dirs = {
            "/home/tusqasi/.config/qtile",
            "/home/tusqasi/.config/nvim",
            "/home/tusqasi/.config/zsh",
            -- "/home/tusqasi/.config/fish",
            -- "/home/tusqasi/.config/awesome",
            "/home/tusqasi/script"
        }
    }
    require("telescope.builtin").find_files(opts)
end

M.find_in_nvim_configs = function()
    local opts = {
        cwd = vim.g.nvim_dir,
        find_files = "rg",
        search_dirs = {vim.g.nvim_dir}
    }
    require("telescope.builtin").live_grep(opts)
end

M.packer_sync = function()
    print("Sourcing nvim/plugin/plugins.lua")
    vim.cmd("source " .. vim.g.nvim_dir .. "/plugin/plugins.lua")
    require("packer").sync()
end

M.flutter_start = function(device)
    if vim.g.flutter_started then
        return
    end
    if not device then
        -- print "selecting device"
        vim.ui.input(
            {prompt = "Enter device for flutter: "},
            function(input)
                device = input or "linux"
            end
        )
        Ok, _ = pcall(vim.cmd, string.format("VimuxRunCommand('flutter run -d %s')", device))
    else
        -- print "device given"
        Ok, _ = pcall(vim.cmd, string.format("VimuxRunCommand('flutter run -d %s')", device))
    end
    if Ok then
        -- print "Flutter started"
        vim.g.flutter_started = true
    end
end

return M
