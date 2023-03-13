"
" My Nvim config file.
"   https://github.com/redjax/nvim
"
" The init.vim file sources all configurations & plugin installations
"   from files in the conf/ directory. I do my best to make commands cross-platform
"   (sometimes disabling features, if they aren't available on a certain platform).
"
" NOTE FOR MAC USERS: None of this configuration is tested on Mac.
"

"
" Copy & paste lines below for new files to source.
"   The lines check that a file is readable, and check a different path per-environment.

" if has("win32") || has("win64")
"     " Windows Environment
" 
"     if filereadable(expand('~/AppData/Local/nvim/'))
"         source ~/AppData/Local/nvim/conf/<CONF>.vim
"     end
" 
" elseif has('unix')
"     " Linux/Mac Environment
" 
"     source ~/.config/nvim/conf/<CONF>.vim
" endif
"


" Environment
if filereadable(expand('~/AppData/Local/nvim/conf/environment.vim'))
    source ~/AppData/Local/nvim/conf/environment.vim
end

" Mappings
if filereadable(expand('~/AppData/Local/nvim/conf/key-mappings.vim'))
    source ~/AppData/Local/nvim/conf/key-mappings.vim
end

" autocmd Rules
if filereadable(expand('~/AppData/Local/nvim/conf/autocmd-rules.vim'))
    source ~/AppData/Local/nvim/conf/autocmd-rules.vim
end

" Vim Plug plugin manager
if filereadable(expand('~/AppData/Local/nvim/conf/vimplug/vimplug-core.vim'))
    source ~/AppData/Local/nvim/conf/vimplug/vimplug-core.vim
end

" Loop over plugin configurations
for f in split(glob('~/AppData/Local/nvim/conf/plugin-conf/*.vim'), '\n')
    exe 'source' f
endfor
