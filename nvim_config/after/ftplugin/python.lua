-- # Settings for Python files

-- Detect filetype
vim.bo.filetype = "python"

-- Set autoindent
vim.opt.autoindent = true
-- Scope to window file is open in
vim.opt.cursorline = true
vim.opt.autowrite = true

-- Set indent for Python files
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- Python ignore files
vim.opt.wildignore = {
    '*/__pycache__/*',
    '*/*.pyc/*'
}
