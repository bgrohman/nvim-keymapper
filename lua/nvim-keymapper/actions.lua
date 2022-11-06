local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local module = {}

local replace = function(prompt_bufnr)
    actions.close(prompt_bufnr)
    local selection = action_state.get_selected_entry()
    local leader = vim.g.mapleader or '\\\\'
    local keys = string.gsub(selection['lhs'], '<leader>', leader)
    keys = vim.api.nvim_replace_termcodes(keys, true, false, true)
    vim.api.nvim_input(keys)
end

module.attach_mappings = function(prompt_bufnr, _)
    actions.select_default:replace(function()
        replace(prompt_bufnr)
    end)
    return true
end

return module
