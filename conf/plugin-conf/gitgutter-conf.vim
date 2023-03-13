if has("win32") || has("win64")
    " Handle 'git.*' files on Windows
    let g:gitgutter_git_executable = 'C:\Program Files\Git\bin\git.exe'
endif
