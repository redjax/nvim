-- # This config utilizes the map function defined in conf/globals.lua

-- # Set leader & local leader keys
vim.api.nvim_set_keymap("", ",", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- # Pane splitting
--   <Leader> + h: horizontal split
--   <Leader> + v: vertical split
map("n", "<Leader>h", ":<C-u>split<CR>")
map("n", "<Leader>v", ":<C-u>vsplit<CR>")

-- # Session management
map("n", "<Leader>so", ":OpenSession<Space>")
map("n", "<Leader>ss", ":SaveSession<Space>")
map("n", "<Leader>sd", ":DeleteSession<CR>")
map("n", "<Leader>sc", ":CloseSession<CR>")
