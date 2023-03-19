" Map NERDTree keys
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTree<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Open NERDTree automatically when neovim is openedd
" autocmd VimEnter * NERDTree

" Start NERDTree when neovim is opened with no file
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" nerdtree: ignore files
let NERDTreeIgnore = ['\.pyc$', '^__pycache__$']
