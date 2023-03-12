" environment detection {{{
if has("win32") || has("win64")
  let g:plugged_home = "~/AppData/Local/nvim/plugged"
else
  let g:plugged_home = "~/.local/share/nvim/plugged"
endif

"}}}

" code folding
set foldmethod=marker

" filetype indentation
filetype plugin indent on

" syntax
syntax on
syntax enable
set ruler

" colorscheme {{{

" Dark/light background
set background=dark

" Uncomment a theme below to set it as the theme
    " colorscheme challenger_deep
    " colorscheme minimalist
    colorscheme hybrid
    " colorscheme onedark
" }}}

" Change window title to current file being edited
set title

" disable error beeps
set noerrorbells

" Display CLI tab complete options as menu
set wildmenu

" True Color support if available
if has("termguicolors")
  set termguicolors
endif

" Text rendering options
"   Neovim uses UTF-8 as default
set encoding=UTF-8
set fileencoding=UTF-8
" Avoid wrapping line in middle of a word
set linebreak
" Enable line wrapping
set wrap
" Line numbers
set number

" Numbers scroll around current line
" set relativenumber

" Open invisible buffer on start
set hidden

" Show last command when entering command mode
set showcmd

" Mouse support
set mouse=a

" Do not show -- INSERTION -- in command line
set noshowmode
set noshowmatch
set lazyredraw

" Improve searching within file
set ignorecase
set smartcase
" Search highlighting
set hlsearch
" Incremental search/partial matches
set incsearch

" Performance options
" Limit files search for autocomplete
set complete-=i

" Turn off backup
set nobackup
set noswapfile
set nowritebackup

" Vim-autoformata
noremap <F3> :Autoformat<CR>

" Misc
" Automatically re-read if unmodified version is open in nvim
set autoread
" Allow backspacing over indents, line breaks, inserts
set backspace=indent,eol,start
" Prompt when closing without saving
set confirm
" Increase undo limit
set history=1000
" Ignored file extensions
set wildignore+=.pyc,.swp
" Editing between Windows & Linux
set bomb
" Not sure what this does, but I read somewhere to use it
let mapleader=","

" Tries to set shell from env, defaults to bash
" if exists("$SHELL")
"   set shell=$SHELL
" else
"   set shell=/bin/sh
" endif

" session management
let g:session_directory = "~/AppData/Local/nvim/session"

