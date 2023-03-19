-- # Get OS environment.
--   uname is used below to set global env variables
local uname = vim.loop.os_uname()

-- Set global default tabwidth
_G.tab_width = 2

-- # Set global variables
--  _G syntax is to allow mapping to "G", which is normally
--  nvim's "global" variable syntax
_G.os = uname.sysname
_G.is_mac = os == 'Darwin'
_G.is_linux = os == 'Linux'
_G.is_win = os:find 'Windows' and true or false
_G.is_wsl = is_linux and uname.release:find 'Microsoft' and true or false

-- # Detect environment
if _G.is_linux then
    -- # Linux environment
    -- print('[DEBUG] This is a Linux environment')

    -- Set nvim base path for Linux environments
    _G.nvim_base = '~/.config/nvim'

elseif _G.is_win then
    -- # Windows environment
    -- print('[DEBUG] This is a Windows environment')

    -- Set nvim base path for Windows environments
    _G.nvim_base = '~/AppData/Local/nvim'

end

-- # Set colorscheme
-- Set colorscheme
vim.cmd [[
    colorscheme hybrid
]]

-- # Tab/indent
-- Preserve line indentation
vim.opt.breakindent = true
-- Set number of spaces for tab
vim.opt.tabstop = _G.tab_width
-- Set shiftwidth, number of characters nvim will use to indent a line
--   Should match opt.tabstop
vim.opt.shiftwidth = _G.tab_width
-- Switch tab characters to space
vim.opt.expandtab = true