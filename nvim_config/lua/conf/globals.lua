-- # Function to create nvim keymaps quickly
map = function (mode, lhs, rhs, opts)
    -- mode = nvim mode (Normal/Insert)
    -- lhs = the custom defined keybind
    -- lhs = commands/existing keybinds to customize
    -- opts = additional options, i.e. silent, noremap, etc
    --   see :h map-arguments for more info
    local options = { noremap = true }

    if opts then
        options = vim.tbl_extend("force", options, opts)
    end

    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end