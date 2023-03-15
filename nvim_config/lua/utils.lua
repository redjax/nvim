-- # Utility functions & modules

-- "M" is the standard for variables in Lua
local M = {}

function M.map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end

    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Return/export M so other modules can access with require("utils").map
return M
