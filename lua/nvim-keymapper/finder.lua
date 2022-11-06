local entry_display = require('telescope.pickers.entry_display')
local finders = require('telescope.finders')
local Path = require('plenary.path')

local mappings = require('nvim-keymapper.mappings')

local module = {}

local displayer = entry_display.create({
    separator = '│ ',
    items = {
        { width = 0.15 },
        { width = 0.35 },
        { width = 0.50 }
    }
})

local make_display = function(entry)
    return displayer({
        {entry.mode .. ' ' .. entry.lhs, 'TelescopeResultsIdentifier'},
        {entry.rhs, 'TelescopeResultsComment'},
        {entry.doc_string, 'TelescopeResultsFunction'}
    })
end

local get_results_from_mappings = function(m)
    local results = {}
    for _, v in pairs(m) do
        table.insert(results, v)
    end
    return results
end

local get_rhs_label = function(entry)
    local rhs = entry.rhs

    if (type(rhs) == 'function') then
        local rhs_info = debug.getinfo(rhs)
        -- Shorten path to 1 character per part except for the first and last 2 path parts.
        local function_source_path = Path.new(rhs_info['short_src']):shorten(1, {1, -1, -2})
        rhs = '[Function] ' .. function_source_path .. ' ' .. (rhs_info['name'] or rhs_info['namewhat'] or '')
    end

    return rhs
end

module.make_finder = function()
    return finders.new_table({
        results = get_results_from_mappings(mappings.get_all()),
        entry_maker = function(entry)
            local rhs = get_rhs_label(entry)
            return {
                value = entry.lhs,
                ordinal = entry.mode .. ' ' .. entry.lhs .. ' ' .. rhs .. ' ' .. entry.doc_string,
                mode = entry.mode,
                lhs = entry.lhs,
                rhs = rhs,
                doc_string = entry.doc_string,
                display = make_display
            }
        end
    })
end

return module
