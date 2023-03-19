-- Remove trailing whitespace on save
vim.api.nvim_exec(
	[[
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
]],
	true
)
