" Vim PlugDefaults {{{

    if has('vim_starting')
        set nocompatible " Be iMproved
    endif

    if has("win32") || has("win64")
        " Windows Vim Plug setup

        let g:plugged_home = '~/AppData/Local/nvim-data/plugged'

        let vimplug_exists=expand('~/AppData/Local/nvim/autoload/plug.vim')

        let g:vim_bootstrap_langs = 'python'
        let g:vim_bootstrap_editor = 'nvim'

        " Install vim-plug if it's not already installed {{{

            if !filereadable(vimplug_exists)
                echo 'Installing Vim Plug...'
                echo '
                silent !\curl -fLo ~/AppData/Local/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
                let g:not_finish_vimplug = 'yes'

                autocmd VimEnter * PlugInstall
            endif

        "}}}

    elseif has('unix')
        " Linux/Mac environment

        let g:plugged_home = '~/.local/share/nvim/plugged'

        let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')

        let g:vim_bootstrap_langs = 'python'
        let g:vim_bootstrap_editor = 'nvim'

        " Install vim-plug if it's not already installed {{{

        if !filereadable(vimplug_exists)
            echo 'Installing Vim Plug...'
            echo '
            silent !\curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
            let g:not_finish_vimplug = "yes"

            autocmd VimEnter * PlugInstall
        endif

        "}}}

    endif

"}}}


" Vim-Plug initialization {{{

    call plug#begin(g:plugged_home)

        if has("win32") || has("win64")
            " Windows environment

            " Include user's extra bundle(s)
            if filereadable(expand('~/AppData/Local/nvim/local_bundles.vim'))
                source ~/AppData/Local/nvim/local_bundles.vim
            endif

            " Source vim plugin installs
            if filereadable(expand('~/AppData/Local/nvim/conf/vimplug/plug-installs.vim'))
                source ~/AppData/Local/nvim/conf/vimplug/plug-installs.vim
            end

        elseif has("unix")
            " Linux/Mac environment

            " Include user's extra bundle(s)
            if filereadable(expand('~/.config/nvim/local_bundles.vim'))
                source ~/.config/nvim/local_bundles.vim
            endif

            " Source vim plugin installs
            if filereadable(expand('~/.config/nvim/conf/vimplug/plug-installs.vim'))
                source ~/.config/nvim/conf/vimplug/plug-installs.vim
            end

        endif

    " End Vim plug
    call plug#end()

"}}}
