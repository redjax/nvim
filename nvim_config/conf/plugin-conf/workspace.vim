" Activate session tracking automatically
let g:workspace_autocreate = 1

" Load files from workspace in same tab
let g:workspace_create_new_tabs = 0  " enabled = 1 (default), disabled = 0

" Bing toggle workspace to leader + s -> ,s
nnoremap <leader>s :ToggleWorkspace<CR>

" Set workspace session filename
let g:workspace_session_name = 'Session.vim'

" Set a single external directory to save sessions in
" let g:workspace_session_directory = $HOME . '/.vim-sessions/

" Disable automatic loading of detected workspace
" let g:workspace_session_disable_on_args = 1

" Manage undo history
let g:workspace_persist_undo_history = 1  " enabled = 1 (default), disabled = 0
let g:workspace_undodir='.undodir'

" Turn autosave on, even when not in a session
let g:workspace_autosave_always = 1

" Disable autosave by setting to 0
let g:workspace_autosave = 1

