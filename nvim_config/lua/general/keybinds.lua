-- # Global keybinds

-- Set leader key
-- Keybind.g({{ "", ",", "<Nop>", { noremap = true, silent = true } }})
-- vim.g.mapleader = ","
-- vim.g.maplocalleader = ","

Keybind.g({

    -- Reload config with <Leader><CR>
    { "n", "<Leader><CR>", ":luafile $MYVIMRC<CR>", { noremap = true} },

    --[[
        Cursor Movement
    --]]

    -- [ <Leader> + h ] move cursor to left window
    { "n", "<Leader>h", "<Cmd>wincmd h<CR>", { noremap = true} },

    -- [ <Leader> + l ] move cursor to bottom window
    { "n", "<Leader>j", "<Cmd>wincmd j<CR>", { noremap = true} },

    -- [ <Leader> + j ] move cursor to top window
    { "n", "<Leader>k", "<Cmd>wincmd k<CR>", { noremap = true} },

    -- [ <Leader> + k ] move cursor to right window
    { "n", "<Leader>l", "<Cmd>wincmd l<CR>", { noremap = true} },

    -- [ <Leader> + c ] highlight cursorline
    { "n", "<Leader>c", [[<Cmd>set cursorline! cursorcolumn!<CR>]], { noremap = true} },

    --[[
        Resize Window
    --]]

    -- <Leader>+ = Increase size
    { "n", "<Leader>+", "<Cmd>vertical resize +5<CR>", { noremap = true} },
    -- <Leader>- = Reduce size
    { "n", "<Leader>-", "<Cmd>vertical resize -5<CR>", { noremap = true} },
    -- <Leader>rp set full size
    { "n", "<Leader>rp", "<Cmd>resize 100<CR>", { noremap = true} },

    --[[
        Terminal Keybinds
    --]]

    -- <Leader>\\t (tab) = Open terminal
    { "n", "<Leader>\\t", "<Cmd>terminal<CR>", { noremap = true} },
    -- Turn terminal to normal mode with escape
    { "t", "<Esc>", "<C-\\><C-n>", { noremap = true} },
    -- Open neovim terminal
    { "n", "<c-n>", "<Cmd>call OpenTerminal()<CR>", { noremap = true} },

    --[[
        Pane splitting    
    --]]

    -- <Leader>h = horizontal split
    { "n", "<Leader>h", ":<C-u>split<CR>", { noremap = true} },
    -- <Leader>v = vertical split
    { "n", "<Leader>v", ":<C-u>vsplit<CR>", { noremap = true} },

    --[[
        Session management    
    --]]

    -- # Session management
    { "n", "<Leader>so", ":OpenSession<Space>", { noremap = true} },
    { "n", "<Leader>ss", ":SaveSession<Space>", { noremap = true} },
    { "n", "<Leader>sd", ":DeleteSession<CR>", { noremap = true} },
    { "n", "<Leader>sc", ":CloseSession<CR>", { noremap = true} },

})