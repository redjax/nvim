# My Neovim configuration file

## Description

I use Neovim across Linux hosts (mostly Debian/Ubuntu, but occasionally Fedora & openSuSE). I am working to make my `nvim` configuration directory cross-platform.

`init.vim` sources configuration files in `conf/`. My `init.vim` was getting large and difficult to maintain, so I broke the various configurations into smaller pieces. Over time, I hope to break these out even more to make configurations pluggable depending on the host platform.

## Setup/Usage

- On `Linux` hosts
	- `nvim` config path: `~/.config/nvim`

- On `Windows` hosts
  - `nvim` config path: `~/AppData/Local/nvim`
	
- All hosts:
	- Clone the repository: `git clone git@github.com:redjax/nvim.git`
	- Run `Plug` install command(s):
	  - `nvim +PlugInstall +PlugUpdate +qa`
	- Run with `nvim` to make sure there are no errors.

## Vim/Nvim Plugins

My setup uses multiple plugins. I use [Vim Plug](https://github.com/junegunn/vim-plug) to install plugins.

### In Use

- NERDTree
	- URL: https://github.com/preservim/nerdtree
  - Plug Install: `Plug 'preservim/nerdtree'`

- Syntastic
  - URL: https://github.com/vim-syntastic/syntastic
  - Plug Install: `Plug 'vim-syntastic/syntastic'`

- vim-surround
  - URL: https://github.com/tpope/vim-surround
  - Plug Install: `Plug 'tpope/vim-surround'`

- Vim-Fugitive
  - URL: https://github.com/tpope/vim-fugitive
  - Plug Install: `Plug 'tpope/vim-fugitive'`

- Git-Gutter
  - URL: https://github.com/airblade/vim-gitgutter/
  - Plug Install: `Plug 'airblade/vim-gitgutter'`

- Airline
  - URL: https://github.com/vim-airline/vim-airline
  - Plug Install: `Plug 'vim-airline/vim-airline'`

- Airline-Themes
  - URL: https://github.com/vim-airline/vim-airline-themes
  - Plug Install: `Plug 'vim-airline/vim-airline-themes'`

- Virtualenv
  - URL: https://github.com/jmcantrell/vim-virtualenv
  - Plug Install: `Plug 'jmcantrell/vim-virtualenv'`

- CtrlSpace
  - URL: https://github.com/vim-ctrlspace/vim-ctrlspace
  - Plug Install: `Plug 'vim-ctrlspace/vim-ctrlspace'`

- IndentGuides
  - URL: https://github.com/thaerkh/vim-indentguides
  - Plug Install: `Plug 'thaerkh/vim-indentguides'`

- Visual-Multi
  - URL: https://github.com/mg979/vim-visual-multi
  - Plug Install: `Plug 'mg979/vim-visual-multi', {'branch': 'master'}`

- Vim-Polyglot
  - URL: https://github.com/sheerun/vim-polyglot
  - Plug Install: `Plug 'sheerun/vim-polyglot'`

- Delimitmate
  - URL: https://github.com/raimondi/delimitmate
  - Plug Install: `Plug 'raimondi/delimitmate'`

- Better Whitespace
  - URL: https://github.com/ntpeters/vim-better-whitespace
  - Plug Install: `Plug 'ntpeters/vim-better-whitepsace'`

- Comfortable Motion
  - URL: https://github.com/yuttie/comfortable-motion.vim
  - Plug Install: `Plug 'yuttie/comfortable-motion.vim'`

### Will/Might Try

- Ale
  - URL: https://github.com/dense-analysis/ale
  - Plug Install: `Plug 'dense-analysis/ale'`

- Lightline
  - URL: https://github.com/itchyny/lightline
  - Plug Install: `Plug 'itchyny/lightline.vim'`

- Onedark
  - URL: https://github.com/joshdick/onedark.vim
  - Plug Install: `Plug 'joshdick/onedark.vim'`

- CtrlP
  - URL: https://github.com/ctrlpvim/ctrlp.vim
  - Plug Install: `Plug 'ctrlpvim/ctrlp.vim'`

## Links & Notes

### Notes

- In `.vim` files, a `"` is for comments
- Check environment (Windows, Mac/Linux) before a vim configuration line

```
if has("win32") || has("win64")
    " Windows environment

elseif has("unix")
    " Mac/Linux environment

end
```

- Using variables
  - Get variable man pages with `:help internal-variables`
  - Set a global variable with `g:<variableName> = <value>`
    - Global variables are accessible in all `.vim` files
  - Set a script variable with `s:<variableName> = <value>`
    - Script variables are accessible only in the file they are set in
  - Set a function argument with `a:<variableName> = <value>`
    - Function variables are accessible only within the function
  - Access a `vim-variable` with `v:<variableName>`
    - Vim variables are global, andd are pre-defined by Vim/Nvim
  - Use a variable in a string
    - i.e. a variable `s:vimfiles` is declared with value `~/AppData/Local/nvim-data`
    - In the below example, a filepath is built to Vim's `nvim-data` (which is different across platforms), and creates a path to the binary for the current OS.

```
let g:CtrlSpaceFileEngine = s:vimfiles . '/plugged/vim-ctrlspace' . '/bin/file_engine_' . s:os . '_amd64'
```

### Links

