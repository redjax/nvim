-- # Local variables for augroup/autocmd
local cmd = vim.cmd
local api = vim.api

-- Highlight on yank
local highlight = api.nvim_create_augroup("YankHighlight", { clear = true })
api.nvim_create_autocmd("TextYankPost", {
    pattern = "*",
    group = highlight,
    desc = "Highlight yanked text",
    command = 'silent! lua vim.highlight.on_yank()'
})

-- This PC is fast enough, do syntax highlighting
local sync_fromstart = api.nvim_create_augroup("vimrc_sync_fromstart", { clear = true })
api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    group = sync_fromstart,
    desc = "Speed up loading of nvim config files",
    command = "syntax sync maxlines=1000"
})

-- Remember cursor position
local remember_cursor_position = api.nvim_create_augroup("vimrc_remember_cursor_position", { clear = true })
api.nvim_create_autocmd("BufReadPost", {
    pattern = "*",
    group = remember_cursor_position,
    desc = "Remember cursor position from last time file was edited",
    -- Run vimscript commands using [[ double brackets ]]
    command = [[ if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif ]]
})

-- Make/CMake
local vimrc_make_cmake = api.nvim_create_augroup("vimrc_make_cmake", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    pattern = "make",
    group = vimrc_make_cmake,
    desc = "Set noexpandtab on make",
    command = "setlocal noexpandtab"
})
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
    pattern = "CMakeLists.txt",
    group = vimrc_make_cmake,
    desc = "Set filetype to cmake",
    command = "setLocal filetype=cmake"
})
