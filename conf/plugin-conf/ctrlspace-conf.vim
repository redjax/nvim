set nocompatible

if has('win32')
    let s:vimfiles = '~/AppData/Local/nvim'
    let s:os   = 'windows'
else
    let s:vimfiles = '~/.vim'
    if has('mac') || has('gui_macvim')
        let s:os = 'darwin'
    else
    " elseif has('gui_gtk2') || has('gui_gtk3')
        let s:os = 'linux'
    endif
endif

let g:CtrlSpaceFileEngine = s:vimfiles . '/plugged/vim-ctrlspace' . '/bin/file_engine_' . s:os . '_amd64'

" Defined in environment.vim
" set hidden
" set encoding=UTF=8

" Turn tabline off
set showtabline=0
let g:CtrlSpaceDefaultMappingKey = "<C-space> "

" Use CTRL-P for fuzzy search
nnoremap <silent><C-p> :CtrlSpace O<CR>

" Auto-save workspace
let g:CtrlSpaceLoadLastWorkspaceOnStart = 1
let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
let g:CtrlSpaceSaveWorkspaceOnExit = 1

" Speed up glob searching
if executable('rg')
    let g:CtrlSpaceGlobCommand = 'rg --color=never --files'
elseif executable('fd')
    let g:CtrlSpaceGlobCommand = 'fd --type=file --color=never'
elseif executable('ag')
    let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
endif

" Speed up fuzzy search on large projects
let g:CtrlSpaceSearchTiming = 500

