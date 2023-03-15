﻿set nocompatible

if has('win32')
    " Windows Environment

    let g:vimfiles = '~/AppData/Local/nvim-data'
    let g:os   = 'windows'

else
    " Linux/Mac Environment

    let g:vimfiles = '~/.vim'
    
    if has('mac') || has('gui_macvim')
        let g:os = 'darwin'
    else
    " elseif has('gui_gtk2') || has('gui_gtk3')
        let g:os = 'linux'
    endif

endif

let g:CtrlSpaceFileEngine = g:vimfiles . '/plugged/vim-ctrlspace' . '/bin/file_engine_' . g:os . '_amd64'

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