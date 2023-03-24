#!/bin/bash

nvim_appimage_install_dir="/appimage/nvim"

function setup() {

  if [[ ! -d "$nvim_appimage_install_dir" ]]; then
    echo ""
    echo "Preparing install location"
    echo ""

    sudo mkdir -pv "$nvim_appimage_install_dir"

  fi

}

function remove_existing_bin() {

  if [[ -f /usr/bin/nvim.appimage ]]; then
    echo ""
    echo "Removing existing binary at /usr/bin/nvim.appimage"
    echo ""

    sudo rm /usr/bin/nvim.appimage

  fi

}

function remove_existing_squashfs() {

  if [[ -d ./squashfs-root ]]; then
    rm -r ./squashfs-root
  fi

}

function remove_existing_nvim_appimage() {

  if [[ -f ./nvim.appimage ]]; then

    echo ""
    echo "Removing existing nvim.appimage"
    echo ""

    rm ./nvim.appimage

  fi

}

function remove_existing_root_squashfs() {

  if [[ -d "$nvim_appimage_install_dir/squashfs-root" ]]; then
    echo ""
    echo "Removing existing install at $nvim_appimage_install_dir/squashfs-root"
    echo ""

    sudo rm -r "$nvim_appimage_install_dir/squashfs-root"
  fi

}

function remove_existing_squashfs() {

  if [[ -d squashfs-root ]]; then
    echo ""
    echo "Removing existing install at squashfs-root"
    echo ""

    sudo rm -r squashfs-root
  fi

}

setup

remove_existing_bin
remove_existing_nvim_appimage
remove_existing_squashfs

echo ""
echo "Downloading Neovim appimage"
echo ""

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage

if [[ -f nvim.appimage ]]; then

  echo ""
  echo "Setting executable on appimage"
  echo ""

  chmod u+x nvim.appimage

  echo ""
  echo "Extracting AppImage"
  echo ""

  remove_existing_squashfs

  ./nvim.appimage --appimage-extract

  echo ""
  echo "Squashing fs"
  echo ""

  ./squashfs-root/AppRun --version

  remove_existing_root_squashfs

  echo ""
  echo "Moving squashfs to $nvim_appimage_install_dir/squashfs-root"
  echo ""

  sudo mv squashfs-root $nvim_appimage_install_dir

  remove_existing_squashfs

  if [[ ! -f "/usr/bin/nvim" ]]; then
    echo ""
    echo "Creating alias /usr/bin/nvim"
    echo ""

    sudo ln -s $nvim_appimage_install_dir/squashfs-root/AppRun /usr/bin/nvim
  else
    echo ""
    echo "Skipping alias creation, binary already exists at /usr/bin/nvim"
    echo ""
  fi

else

  echo ""
  echo "[ERROR] Could not set executable on nvim.appimage, file does not exist"
  echo ""

  exit 1

fi

remove_existing_nvim_appimage
