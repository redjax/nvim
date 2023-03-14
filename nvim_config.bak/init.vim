"
" My Nvim config file.
"   https://github.com/redjax/nvim
"
" The init.vim file sources all configurations & plugin installations
"   from files in the conf/ directory. I do my best to make commands cross-platform
"   (sometimes disabling features, if they aren't available on a certain platform).
"
" Variables with a d_ are for dir paths, f_ are for file paths, and p_ are for plugins.
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

" Check OS nvim is running on
let g:uname = substitute(system('uname'), '\n', '', '')

" if has('win32') || has('win64')
"     " Set nvim conf base directory paths for Windows environments

"     let g:d_nvim_base = '~/AppData/Local/nvim'

" elseif has('unix')
"     " Set nvim conf base directory path for Linux environments

"     let g:d_nvim_base = '~/.config/nvim'

" end

if has('linux') || has('mac')
    let g:d_nvim_base = '~/.config/nvim'
elseif has('win32') || has('win64')
    let g:d_nvim_base = '~/AppData/Local/nvim'
end

" Set path to autoload/ with vim-plug's autoload script
let g:d_autoload_conf = g:d_nvim_base . '/autoload'
" Set path to colors/ dir with colorscheme files
let g:d_colorschemes_conf = g:d_nvim_base . '/colors'
" Set path to conf/ dir with core config files
let g:d_nvim_conf = g:d_nvim_base . '/conf'
" Set path to conf/vimplug/
let g:d_vimplug_conf = g:d_nvim_conf . '/vimplug'
" Set path to conf/vimplug/plugin-conf dir
let g:d_vimplug_plugin_conf = g:d_vimplug_conf . '/plugin-conf'

" Set script vars (local to init.vim) for *.vim files
let g:f_environment_vim = g:d_nvim_conf . '/environment.vim'
let g:f_key_mappings_vim = g:d_nvim_conf . '/key-mappings.vim'
let g:f_autocmd_rules_vim = g:d_nvim_conf . '/autocmd-rules.vim'
let g:f_vimplug_core = g:d_vimplug_conf . '/vimplug-core.vim'
let g:f_plug_installs = g:d_vimplug_conf . '/plug-installs.vim'


" Environment
" if filereadable(expand('~/AppData/Local/nvim/conf/environment.vim'))
if filereadable(expand('g:f_environment_vim'))
    " source ~/AppData/Local/nvim/conf/environment.vim
    source g:f_environment_vim
end

" Mappings
" if filereadable(expand('~/AppData/Local/nvim/conf/key-mappings.vim'))
if filereadable(expand('g:f_key_mappings_vim'))
    " source ~/AppData/Local/nvim/conf/key-mappings.vim
    source g:f_key_mappings_vim
end

" autocmd Rules
" if filereadable(expand('~/AppData/Local/nvim/conf/autocmd-rules.vim'))
if filereadable(expand('g:f_autocmd_rules_vim'))
    " source ~/AppData/Local/nvim/conf/autocmd-rules.vim
    source g:f_autocmd_rules_vim
end

" Vim Plug plugin manager
" if filereadable(expand('~/AppData/Local/nvim/conf/vimplug/vimplug-core.vim'))
if filereadable(expand('g:f_vimplug_core'))
    " source ~/AppData/Local/nvim/conf/vimplug/vimplug-core.vim
    source g:f_vimplug_core
end

" Loop over plugin configurations
" for f in split(glob('~/AppData/Local/nvim/conf/plugin-conf/*.vim'), '\n')
for f in split(glob('g:d_vimplug_plugin_conf'), '\n')
    exe 'source' f
endfor
