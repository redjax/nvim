Table of Contents

- [Description](#description)
- [Setup/Usage](#setupusage)
- [Directory Structure](#directory-structure)
- [Links \& Notes](#links--notes)
  - [Notes](#notes)
  - [Links](#links)

## Description

I use Neovim across Linux hosts (mostly Debian/Ubuntu, but occasionally Fedora & openSuSE). I am working to make my `nvim` configuration directory cross-platform.

`init.vim` sources configuration files in `conf/`. My `init.vim` was getting large and difficult to maintain, so I broke the various configurations into smaller pieces. Over time, I hope to break these out even more to make configurations pluggable depending on the host platform.

This repository uses a `Github Actions` workflow file (in `.github/workflows/`) to create a `.zip` and `.tar.gz` tagged release when a PR is made with the `release` label. This is so the configuration can be downloaded as an archive when access to Github is unavailable.

## Setup/Usage

**Note**: `nvim` config path: `~/.config/nvim`

- Clone the repo
  - `$ git clone https://github.com/redjax/nvim`
  - Or with SSH: `$ git clone github.com:redjax/nvim`
-  Run setup scripts
   -  **Linux hosts**
      -  `$ cd scripts`
         -  Install nvim: `$ ./get_nvim_appimage.sh`
         -  Install packer: `$ ./install_nvim_packer.sh`
         -  Run setup script
            -  `$ ./update_nvim_conf.sh`
   -  **Windows hosts**
      -  `$ cd scripts`
         -  Install nvim buildtools: `$ .\install_nvim_buildtools.ps1`
         -  Install `Packer`: `$ .\install_nvim_packer.ps1`
         -  Run setup script
            -  `$ .\update_nvim_conf.ps1`


**IMPORTANT**: Some of the automated setup may fail. This is normal, and I'm still trying to figure out a way to work around this. The steps below tend to fix plugin installs/configuration issues:

  - Re-run the `Packer` install a couple of times
    - `$ nvim +PackerSync +qa`
    - OR
      - open `nvim` from the CLI, then run `PackerSync` a few times
    - You may need to run `PackerSync`, exit nvim, re-open nvim, and run it again multiple times before the environment will be fully configured

## Directory Structure

- `.github/workflows/`
  - `.yml` files for Github Actions
- `nvim_config/`
  - The core `nvim` configuration files.
  - This directory is copied/symlinked by the `update_nvim_conf` scripts on Windows/Linux hosts
- `scripts/`
  - Scripts to run on Linux/Windows hosts to:
    - Install dependencies
    - Configure environment before nvim install
      - i.e. install build tools, `Packer` (for plugins), etc

## Links & Notes

### Notes

- Open nvim & immediately run command
  - `nvim +SomeCommand`
  - i.e. to run `:PlugInstall` automatically:
    - `nvim +PlugInstall`
  - You can also open nvim, run a command, and exit with `+qa`
    - i.e. Run `:PlugInstall` and `:PlugClean`, then exit
    - `nvim +PlugInstall +PlugClean +qa`

- Detect host OS and only run certain commands on specific host
  - First, set local variables at the top of the `.lua` file

```
-- Define host environment
local uname = vim.loop.os_uname()
-- Set local env var for OS
local _OS = uname.sysname
```

- Then, you can reference the `_OS` var to do a string comparison
  - For example, to only install a plugin (i.e. `markdown-preview`) only on `Linux` hosts:

```
-- Define host environment
local uname = vim.loop.os_uname()
-- Set local env var for OS
local _OS = uname.sysname

if _OS == "Linux" then
  print("Linux host detected. Installing markdown-preview.nvim)
  use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})
else
  print("Nvim is not running in a Linux environment, skipping install of markdown-preview.nvim")
end
```

- In this example, the `markdown-preview.nvim` plugin will only be installed if the `_OS` string matches `"Linux"`
  - The line will be skipped on Mac/Windows environment

### Links

- [Github: tiagovla .dotfiles](https://github.com/tiagovla/.dotfiles/tree/master/neovim/.config/nvim)
  - Reference repo used to create directory structure in `nvim_config/`
  - I also used a lot of tiagovla's `.lua` files as a reference, or just straight up copied them, for plugin/environment config
- [Github: mthnglac dotfiles](https://github.com/mthnglac/dotfiles/tree/master/nvim)
  - Another reference repo for nvim configuration
