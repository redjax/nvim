-- ## Main nvim configuration
--  This file is written in Lua. For help, see:
--    https://neovim.io/doc/user/lua-guide.html
--
--  Help can also be accessed with :help lua

-- # Config imports
--   require syntax uses 'lua' dir as starting point. For nested files/dirs,
--     use dot notation, i.e. conf.some-file.lua

-- Speed up loading Lua modules
if pcall(require, "impatient") then
    require("impatient").enable_profile()
else
    print("Failed to load Impatient.")
end

require "plugin-installs"
require "utils"
require "general"
