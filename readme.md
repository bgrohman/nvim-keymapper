# nvim-keymapper

[Telescope](https://github.com/nvim-telescope/telescope.nvim) extension for creating, documenting, and searching your keymappings.

## Install

1. Install [Telescope](https://github.com/nvim-telescope/telescope.nvim).
2. Register nvim-keymapper as a Telescope extension: 
    ```lua
    require('telescope').load_extension('nvim-keymapper')
    ```
3. Set up commands and keymappings:
    ```lua
    local keymapper = require('nvim-keymapper')    
    vim.api.nvim_create_user_command('Keymaps', keymapper.keymaps_picker, {})
    module.set('n', '<leader>k', ':Keymaps<CR>', {}, 'Show keymappings')
    ```
