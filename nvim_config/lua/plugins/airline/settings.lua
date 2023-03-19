-- # Airline settings

-- # Available themes

-- dark
-- hybridline
-- bubblegum
-- badwolf
-- badwolf
-- hybrid
-- onedark
-- angr


require("airline").setup({
    options = {
        
        -- Set airline symbols, if not set already
        if !exists(airline_symbols) then
            let Variable.g({ airline_symbols = {} })
        end,

        Variable.g({
            -- Theme
            airline_theme = "hybrid",

            airline_symbols.space = "\ua0",

            -- Skip loading sections that would be empty
            airline_skip_empty_sections = 1,

            -- Enable tagbar
            airline[extensions][tagbar][enabled] = 1,

            -- Enable syntastic integration
            airline[extensions][syntastic][enabled] = 1
        })
})
