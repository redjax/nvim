########################################################
# Setup Nvim on new Windows hosts.                     #
#                                                      #
# !!IMPORTANT!!                                        #
# This script must be run as an administrator in order #
#   to create the symlink to ~/AppData/local/nvim      #
########################################################

$USR = @(cmd.exe /c whoami).split("\")[1] -join "`n"
$USR_DIR = "C:\Users\$USR"

$SRC = "$USR_DIR\git\nvim\nvim_config"
$TAR = "$USR_DIR\AppData\Local\nvim"

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

function symlink_nvim_config() {

    $LINK_CMD = "mklink /J `"$TAR`" `"$SRC`""

    Write-Host "Creating link to: [$SRC] at target destination: [$TAR]"

    cmd.exe /c $LINK_CMD

}

function Main() {

    ## Ensure Neovim is installed
    InstallNvim

    ## If nvim's config path exists, remove all items leaving parent dir
    If ( Test-Path -Path "$TAR" ) {
        Write-Host "Removing existing nvim conf directory"

        ## Remove symlink
        fsutil reparsepoint delete $TAR

        If ( Test-Path -Path "$TAR" ) {
            ## Removing symlink sometimes leaves a directory behind. Delete that directory
            Remove-Item -Recurse "$TAR"
        }

    }
    
    UpdateFromGit

    If ( $LASTEXITCODE -eq 1 ) {
        Write-Error "There was an unhandled error while updating from git."
    }
    else {

        Write-Host ""
        Write-Host "Changes pulled from git."
        Write-Host ""

        symlink_nvim_config
    }

}

Main
