#!/bin/bash

echo ""
echo "Installing Neovim Packer plugin manager"
echo ""

git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
