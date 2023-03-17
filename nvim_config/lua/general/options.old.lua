-- # Local script vars
-- Remap vim.* commands to simpler syntax
--   These vars are only accesible from this file
local api = vim.api
local g = vim.g
local opt = vim.opt

-- # Environment-specific setup
if _G.is_linux then
    -- # Linux environment

    -- Enable colors in terminal
    opt.termguicolors = true

elseif _G.is_win then
    -- # Windows environment

end

-- # Settings for all environments
-- Set highlight on search
opt.hlsearch = true
-- Show line numbers
opt.number = true
-- Show relative numbers
opt.relativenumber = false
-- Enable mouse mode
opt.mouse = "a"
-- Enable indent break
opt.breakindent = true
-- Save undo history
opt.undofile = true

-- Case insensitive searching, unless /C or capital in search
opt.ignorecase = true
-- Ignore uppercase letters, unless search has uppercase
--   Enhances opt.ignorecase
opt.smartcase = true

-- Enable line wrapping
opt.wrap = true

-- Decrease update time
opt.updatetime = 250
-- Always show sign column
opt.signcolumn = "yes"
-- Access system clipboard
opt.clipboard = "unnamedplus"
-- Use incremental search to speed searches up
opt.incsearch = true
-- ?
opt.hidden = true
-- ?
opt.history = 5000

-- Set patterns for nvim to ignore
opt.wildignore = {
    '*/cache/*',
    '*/tmp/*',
}
