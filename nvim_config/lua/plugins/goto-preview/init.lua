-- Define host environment
local uname = vim.loop.os_uname()
-- Set local env var for OS
local _OS = uname.sysname

if _OS == "Linux" then
    require("plugins.goto-preview.settings")
    require("plugins.goto-preview.keybinds")
end
