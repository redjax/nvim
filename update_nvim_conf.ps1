########################################################
# Setup Nvim on new Windows hosts.                     #
#                                                      #
# !!IMPORTANT!!                                        #
# This script must be run as an administrator in order #
#   to create the symlink to ~/AppData/local/nvim      #
########################################################

function InstallNvim() {
    ## Install Neovim package on Windows using winget

    $winget_install_cmd = "winget install --id Neovim.Neovim"
    Write-Host "Executing: `$ $($winget_install_cmd)"

    Invoke-Expression $winget_install_cmd -ErrorAction Stop

    If ( $LASTEXITCODE -eq 1 ) {
        Write-Error "There was an error installing Neovim with winget."
    }

}

function UpdateFromGit() {
    ## Update neovim configuration files from repo's main branch

    Write-Host ""
    Write-Host "Pulling new changes from main..."
    Write-Host ""

    git checkout main

    If ( $LASTEXITCODE -eq 1 ) {
        Write-Error "Could not check out main branch. Check git log to fix issue, then try again."
    }
    else {
        git fetch ; git pull

        Write-Host "Newest changes applied. You can switch to another branch now, if needed"
    }
}


function Main() {

    ## Ensure Neovim is installed
    InstallNvim

    ## If nvim's config path exists, remove all items leaving parent dir
    If ( Test-Path -Path "~/AppData/Local/nvim" ) {
        Write-Host "Removing existing nvim conf directory"

        Del "~/AppData/Local/nvim/*"
    }

    
    UpdateFromGit

    If ( $LASTEXITCODE -eq 1 ) {
        Write-Error "There was an unhandled error while updating from git."
    }
    else {

        Write-Host ""
        Write-Host "Changes pulled from git."
        Write-Host ""
    }

    Write-Host "Copying config to ~/AppData/Local/nvim"
    Copy-Item -Path "./nvim_config/*" -Destination "~/AppData/Local/nvim" -Recurse

}

Main
