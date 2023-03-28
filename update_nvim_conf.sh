##
# Symlinks nvim configuration from ./nvim_config to Linux nvim config dir
##

config_src=~/git/nvim/nvim_config/
config_dest=~/.config/nvim

function install_nvim() {

    if ! command -v curl &> /dev/null
    then
        echo "Installing curl"

        sudo apt install -y curl || echo "[ERROR] Unable to install curl." && exit 1
    else
        echo "curl installed, skipping"
    fi

    if ! command -v nvim &> /dev/null
    then
        echo "Installing nvim"

        sudo apt install -y neovim python3-neovim || echo "[ERROR] Unable to install Neovim." && exit 1
    else
        echo ""
        echo "Neovim already installed. Skipping"
        echo ""
    fi

}

function symlink_nvim_config() {

  if [[ ! -d "$config_dest" ]]; then
    if [[ ! -L "$config_dest" ]]; then
      echo "$config_dest does not exist. Creating symlink from [$config_src] to --> [$config_dest]"
      
      ln -s $config_src $config_dest
    fi
  else
    echo "Destination '$config_dest' already exists. Skipping."
  fi

}

function update_from_git() {

    echo "Pulling new changes from main"

    git checkout main
    echo "Update from git status code: $?"

}

function install_vimplug() {

    if [[ ! -f ~/.config/nvim/autoload/plug.vim ]]; then
        echo "Downloading vim-plug"

        curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    else
        echo "Skipping vim-plug install, file already exists."
    fi

}

function fix_nvim_conf_chmod() {

    echo "Setting owner of ~/.config/nvim to $USER"
    sudo chown -R $USER:$USER $HOME/.config/nvim

    echo "Setting chmod to 700 on ~/.config/nvim"
    chmod 700 $HOME/.config/nvim

}

function copy_to_local_bin() {

    if [[ ! -f /usr/local/bin/nvim ]]; then

        if [[ ! -f /usr/bin/nvim ]]; then
            echo "Could not find nvim binary at /usr/bin/nvim"            

        else
            echo "nvim does not exist at /usr/local/bin. Copying from /usr/bin/nvim"
            sudo cp /usr/bin/nvim /usr/local/bin/nvim

        fi

    else
        echo "nvim binary exists at /usr/local/bin/nvim"
    fi

    echo "Setting executable on /usr/local/bin/nvim"
    sudo chmod +x /usr/local/bin/nvim

}

function install_plugins() {

  nvim +PackerInstall +qa

  if [[ $? == 1 ]]; then
    echo "PackerInstall command failed."
  else
    echo "PackerInstall command ran successfully."
  fi

}

function update_plugins() {

  nvim +PackerSync +qa

  if [[ $? == 1 ]]; then
    echo "PackerSync command failed."
  else
    echo "PackerSync command ran successfully."
  fi

}

function main() {

    install_nvim

    symlink_nvim_config

    update_from_git

    install_vimplug

    fix_nvim_conf_chmod

    install_plugins

    update_plugins

    # copy_to_local_bin

}

main

