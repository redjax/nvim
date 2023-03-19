-- # Settings for Python files

-- Detect filetype
vim.bo.filetype = "python"

-- Set autoindent
vim.opt.autoindent = true
-- Scope to window file is open in
vim.opt.cursorline = true
vim.opt.autowrite = true

-- Set indent for Python files
set.tabstop = 4
set.shiftwidth = 4
set.softtabstop = 4
set.expandtab = true

-- Python ignore files
vim.opt.wildignore = {
    '*/__pycache__/*',
    '*/*.pyc/*'
}
