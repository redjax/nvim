-- # Local variables for augroup/autocmd
local cmd = vim.cmd
local api = vim.api


-- Highlight on yank
cmd [[
    augroup YankHighlight
        autocmd!
        autocmd TextYankPost * silent! lua vim.highlight.on_yank()
]]

-- This PC is fast enough, do syntax highlighting
-- synching from start, unless > 200 lines
-- cmd [[
--     augroup vimrc-sync-fromstart
--         autocmd!
--         autocmd BufEnter * :syntax sync maxlines=200
--     augroup end
-- ]]
local sync_fromstart = api.nvim_create_augroup("vimrc_sync_fromstart", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    group = sync_fromstart,
    desc = "Speed up loading of nvim config files",
    command = "syntax sync maxlines=200"
})

-- Remember cursor position
cmd [[
    augroup vimrc-remember-cursor-position
        autocmd!
        autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
    augroup end
]]

-- Make/CMake
cmd [[
    augroup vimrc-make-cmake
        autocmd!
        autocmd FileType make setlocal noexpandtab
        autocmd BufNewFile, BufRead CMakeLists.txt setlocal filetype=cmake
    augroup end
]]
