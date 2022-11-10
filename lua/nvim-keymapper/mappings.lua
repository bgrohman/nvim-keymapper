local module = {}
local mappings = {}

local make_key = function(mode, lhs)
    return mode .. ' ' .. lhs
end

module.set = function(mode, lhs, rhs, opts, doc_string)
    mappings[make_key(mode, lhs)] = {
        mode = mode,
        lhs = lhs,
        rhs = rhs,
        doc_string = doc_string
    }

    opts.desc = doc_string
    vim.keymap.set(mode, lhs, rhs, opts)
end

module.get = function(mode, lhs)
    return mappings[make_key(mode, lhs)]
end

module.get_all = function()
    return mappings
end

return module
