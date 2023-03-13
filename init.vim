"
" My Nvim config file.
"   https://github.com/redjax/nvim
"

"
" Copy & paste for new sources
"   Handles Windows & Unix environments
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
" if filereadable(expand('~/AppData/Local/nvim/conf/vim-plug.vim'))
"     source ~/AppData/Local/nvim/conf/vim-plug.vim
" end

" Vim Plug plugin manager
if filereadable(expand('~/AppData/Local/nvim/conf/vimplug/vimplug-core.vim'))
    source ~/AppData/Local/nvim/conf/vimplug/vimplug-core.vim
end

" Loop over plugin configurations
for f in split(glob('~/AppData/Local/nvim/conf/plugin-conf/*.vim'), '\n')
    exe 'source' f
endfor
