##
# Copies nvim configuration from ./nvim_config to Windows nvim config dir
##

function InstallNvim() {

    $winget_install_cmd = "winget install --id Neovim.Neovim"
    Write-Host "Executing: `$ $($winget_install_cmd)"

    Invoke-Expression $winget_install_cmd

}

function CopyToEmptyFolder() {

    Param(
        [String]$source = ".\nvim_config",
        [String]$target = "~\AppData\Local\nvim"
    )

    Write-Host "Checking if directory $($target) exists, removing if so."
    DeleteIfExistsAndCreateEmptyFolder($target )

    Write-Host "Copying files from [$($source)] to [$($target)]"

    Copy-Item $source\* $target -recurse -force

}

function DeleteIfExistsAndCreateEmptyFolder() {
    Param(
        [String]$dir = "~\AppData\Local\nvim"
    )

    if ( Test-Path $dir ) {
        #http://stackoverflow.com/questions/7909167/how-to-quietly-remove-a-directory-with-content-in-powershell/9012108#9012108
        Get-ChildItem -Path  $dir -Force -Recurse | Remove-Item -force -recurse
        Remove-Item $dir -Force
        New-Item -ItemType Directory -Force -Path $dir

        Write-Host "$($dir) recreated."

    }
    else {
        Write-Host "Skipping delete, dir does not exist: $($dir)"
    }
    
}

function Main() {

    ## Ensure Neovim is installed
    InstallNvim

    ## Delete existing confs & re-copy
    If ( Test-Path -Path "~\AppData\Local\nvim" ) {
        DeleteIfExistsAndCreateEmptyFolder
        CopyToEmptyFolder
    }
    ## Only copy, no existing confs found
    Else {
        CopyToEmptyFolder ".\nvim_config" "~\AppData\Local\nvim"
    }

    Invoke-Expression "nvim +PlugInstall +PlugClean +qa"

    Write-Host ""
    Write-Host "Neovim successfully reconfigured. Run with `$ nvim"
    Write-Host ""

}

Main
