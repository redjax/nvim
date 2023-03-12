" call plug#begin()

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" Plug 'junegunn/vim-easy-align'

" " Plugin outside ~/.vim/plugged with post-update hook
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" call plug#end()

"
" Copy and paste for new sources:
" if filereadable(expand('~/.config/nvim/conf/<CONF>.vim')) 
"   source ~/.config/nvim/conf/<CONF>.vim
" end
"

" Environment
if filereadable(expand('~/AppData/Local/nvim/conf/environment.vim'))
    source ~/AppData/Local/nvim/conf/environment.vim
end

" Mappings
if filereadable(expand("~/AppData/Local/nvim/conf/mappings.vim"))
    source ~/AppData/Local/nvim/conf/mappings.vim
end

" autocmd Rules
if filereadable(expand("~/AppData/Local/nvim/conf/autocmd-rules.vim"))
    source ~/AppData/Local/nvim/conf/autocmd-rules.vim
end

" Vim Plug plugin manager
if filereadable(expand("~/AppData/Local/nvim/conf/vim-plug.vim"))
    source ~/AppData/Local/nvim/conf/vim-plug.vim
end

" Loop over plugin configurations
for f in split(glob("~/AppData/Local/nvim/conf/plugin-conf/*.vim"), "\n")
    exe "source" f
endfor

