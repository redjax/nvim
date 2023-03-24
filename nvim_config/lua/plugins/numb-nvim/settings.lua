require("numb").setup({
    -- Enable/disable "number" while peeking
    show_numbers = true,
    -- Enable/disable "cursorline" while peeking
    show_cursorline = true,
    -- Enable/disable "relativeNumber" while peeking
    hide_relativenumbers = true,
    -- Peek only when command is a number *only* (i.e. don't peek for lines that start with a number, but have other content)
    number_only = false,
    -- Center peek relative to window
    centered_peeking = true
})