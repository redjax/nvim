" Set airline theme {{{
    " https://github.com/vim-airline/vim-airline-themes

    " Uncomment a line to use that theme.
    "    Make sure to uncomment ONLY 1 line
    " let g:airline_theme='dark'
    " let g:airline_theme='hybridline'
    " let g:airline_theme='bubblegum'
    " let g:airline_theme='badwolf'
    " let g:airline_theme='badwolf'
    " let g:airline_theme='hybrid'
    let g:airline_theme='onedark'
    " let g:airline_theme='angr'

"}}}

" Enable airline
let g:airline#extensions#tabline#enabled = 1

if !exists('g:airline_symbols')
    let g:airline_symbols={}
endif

let g:airline_symbols.space="\ua0"

" Skip loading sections that would be empty
let g:airline_skip_empty_sections = 1

" Enable tagbar
let g:airline#extensions#tagbar#enabled = 1

" Enable Syntastic integration
let g:airline#extensions#syntastic#enabled = 1

" Configure separators
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = "|"

" Airline path formatter
let g:airline#extensions#tabline#formatter = 'default'

" Show buffers in tabline
let g:airline#extensions#tabline#show_buffers=0

" Enable hunks
let g:airline#extensions#hunks#enabled=0

" ?
let g:airline#extensions#branch#enabled=1
