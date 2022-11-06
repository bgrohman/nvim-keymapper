local pickers = require('telescope.pickers')
local conf = require('telescope.config').values

local mappings = require('nvim-keymapper.mappings')
local finder = require('nvim-keymapper.finder')
local actions = require('nvim-keymapper.actions')

local module = {}

module.set = function(mode, lhs, rhs, opts, doc_string)
    mappings.set(mode, lhs, rhs, opts, doc_string)
end

module.keymaps_picker = function(opts)
    opts = opts or {}

    pickers.new(opts, {
        prompt_title = 'Keymaps',
        finder = finder.make_finder(),
        sorter = conf.generic_sorter(opts),
        attach_mappings = actions.attach_mappings
    }):find()
end

vim.api.nvim_create_user_command('Keymaps', module.keymaps_picker, {})
module.set('n', '<leader>k', ':Keymaps<CR>', {}, 'Show keymappings')

return module
