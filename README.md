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

## Links & Notes

### Links

### Notes

