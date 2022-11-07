# nvim-keymapper

[Telescope](https://github.com/nvim-telescope/telescope.nvim) extension for creating, documenting, and searching your keymappings.

## Why?

I created nvim-keymapper as a replacement for Telescope's built-in keymaps picker. I wanted something that only shows my custom keymaps and will also show a short documentation string that I can use to help remember what some of the mappings do. The documentation strings are also searchable in the Telescope picker.

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
    keymapper.set('n', '<leader>k', ':Keymaps<CR>', {}, 'Show keymappings')
    ```

## Usage

### Creating Keymaps

Use the `nvim-keymapper.set` function to create your keymaps instead of `vim.keymap.set`. The first four arguments (mode, lhs, rhs, ops) are the same as `vim.keymap.set` and are passed through.

Example: Create a keymap for opening a terminal in a vertical split.
```lua
local keymapper = require('nvim-keymapper')
keymapper.set('n', '<leader>T', '<ESC>:vsplit | term<CR>', {}, 'Open a terminal in a veritcal split')
```

### Using the Telescope Picker

You can start the Telescope picker using the Telescope command:

```
:Telescope nvim-keymapper keymaps_picker
```

Alternatively, if you set up the custom command and keymap above, you can use the `:Keymaps` command or the `<leader>k` keymap.

Pressing Enter after selecting a keymap in the picker will run that keymap.
