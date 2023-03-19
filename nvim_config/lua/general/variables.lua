-- # Variable definitions

-- Define host environment
local uname = vim.loop.os_uname()

Variable.g({ OS = uname.sysname })

-- Set environment value. Use later in scripts like:
--   if IS_LINUX then ... end

-- if IS_LINUX then
--     print("This is a linux host")
--     if vim.fn.has("wsl") then
--         print("This is a WSL linux host")
--     end
-- end
-- uname.IS_LINUX = Variable.g({OS = "Linux" }) == "Linux"
-- uname.IS_WINDOWS = Variable.g({ OS = "Windows" }) == "Windows"
-- uname.IS_MAC = Variable.g({ OS = "Darwin" })


Variable.g({
    loaded_matchparen = 1,
    mapleader = ","
})

Variable.g({
    -- Neoformat
    neoformat_enabled_python = { "black" },
    -- Enable alignment
    neoformat_basic_format_align = 1,
    -- Enable tab to space conversion
    neoformat_basic_format_retab = 1,
    -- Enable trimming of trailing whitespace
    neoformat_basic_format_trim = 1
})

Variable.g({
    vim_be_good_log_file = 1,
    vim_apm_lig = 1,
    -- Define host's Python path
    --   WIP
    -- python3_host_prog = tostring(os.getenv("HOME")) .. "/path/to/python/in/$HOME"
})
