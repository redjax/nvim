$USR=@(cmd.exe /c whoami).split("\")[1] -join "`n"
$USR_DIR="C:\Users\$USR"

$SRC="$USR_DIR\git\nvim\nvim_config"
$TAR="$USR_DIR\AppData\Local\nvim"

$LINK_CMD="mklink /J `"$TAR`" `"$SRC`""

echo "Creating link to: [$SRC] at target destination: [$TAR]"

cmd.exe /c $LINK_CMD

