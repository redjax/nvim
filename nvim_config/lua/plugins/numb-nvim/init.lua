-- Define host environment
local uname = vim.loop.os_uname()
-- Set local env var for OS
local _OS = uname.sysname

require "plugins.numb-nvim.settings"
