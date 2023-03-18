-- # Globals
Option.g({
    bg = "dark",
    encoding = "UTF-8",
    -- Safe-load Vim config files
    exrc = true,
    -- Gui cursor symbol
    guicursor = "",
    -- ??
    nu = true,
    showmode = false,
    cmdheight = 2,
    compatible = false,
    errorbells = false,
    expandtab = true,
    smartindent = true,
    tabstop = 2,
    softtabstop = 2,
    shiftwidth = 2,

    --[[
        Editor options
    --]]

    -- Remove highlighting when search is finished
    hlsearch = true,
    incsearch = true,
    foldlevel = 99,
    foldlevelstart = 99,
    -- Enable mouse mode
    mouse = 'a',
    -- # Create temporary backup of file being edited
    --   'backup' 'writebackup'	action	~
	--   off	     off	no backup made
	--   off	     on		backup current file, deleted afterwards (default)
	--   on	         off    delete old backup, backup current file
	--   on	         on	    delete old backup, backup current file
    backup = false,
    writebackup = true,
    swapfile = false,
    undodir = tostring(os.getenv("HOME")) .. "~/.nvim/undodir",
    undofile = true,
    -- Write changes to swap after "n" milliseconds
    updatetime = 50,
    -- Control how short messages are displayed in status bar
    shortmess = vim.o.shortmess .. "c",
    -- # Open completion menu even for a single item
    --   Do not auto insert items from completion.
    completeopt = "menu,menuone,noselect",

    --[[
        Editing options
    --]]
    smartcase = true,
    ignorecase = true,
    -- Control where windows split
    splitright = true,
    splitbelow = true,
    -- Hide unsaved file when closing vuffer
    hidden = true,
    -- Enable indent break
    breakindent = true,
    -- -- Decrease update time
    updatetime = 250,
    -- -- Always show sign column
    signcolumn = "yes",
    -- -- Access system clipboard
    clipboard = "unnamedplus",
    -- -- ?
    history = 5000,
    -- -- Set patterns for nvim to ignore
    -- wildignore = {
    --     '*/cache/*',
    --     '*/tmp/*',
    -- },
    
})

-- Window options
Option.w({
    --[[
        Editor window options    
    --]]

    -- Show line numbers
    number = true,
    -- Show numbers relative to cursor position
    relativenumber = false,
    -- Code folding method
    foldcolumn = "1",
    foldenable = true,
    -- Show warning signs next to line number in buffer
    signcolumn = "yes",
    -- Nvim tries to keep 100 lines above & below when scrolling
    --   If buffer can't display more than 200 lines, cursor will stay in center
    --     and scroll buffer.
    scrolloff = 0,
    wrap = true,
    colorcolumn = "80",
})
