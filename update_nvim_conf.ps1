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

function SymlinkNvimConfig() {
    ## Create a symlink of this repo to ~/AppData/Local/nvim
    #  This is the path where nvim looks for configurations on Windows.

    Param(
        [String]$source = "./nvim_config/",
        [String]$dest = "~/AppData/Local/nvim"
    )
    If ( Test-Path $dest ) {
        Write-Host "$($dest) exists, moving to $($dest).bak"

        Move-Item $dest $dest.bak
    }
    
    Write-Host "Creating symlink from $($source) to $($dest)"
    
    New-Item -ItemType SymbolicLink -Path "$($dest)" -Target "$($source)" -Force -ErrorAction Stop
    
    If ( $LASTEXITCODE -eq 1 ) {
        Write-Error "There was an error creating the symlink."
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

    ## If nvim's config path doesn't exist, symlink this repo to the place it should be
    If ( -Not (Test-Path -Path "~/AppData/Local/nvim") ) {
        try {
            SymlinkNvimConfig
        }
        catch {
            Write-Error "There was an error creating the symlink to ~/AppData/local/nvim" -ErrorAction Stop
        }
        finally {
            Write-Host "Symlink created successfully."
        }
    }

    
    UpdateFromGit

    If ( $LASTEXITCODE -eq 1 ) {
        Write-Error "There was an unhandled error while updating from git."
    }
    else {

        Write-Host ""
        Write-Host "Neovim successfully reconfigured."
        Write-Host ""
    }

}

Write-Host "Checking for elevated permissions..."

if (-NOT (
        [Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"
    )
) {
    Write-Warning "This script needs to be run as an administrator in order to create the symlink to ~/AppData/Local/nvim."
    Write-Warning "If you do not have admin, try downloading a release from:"
    Write-Warning "  https://github.com/redjax/nvim/tags"
    Break
}
else {
    Main
}
