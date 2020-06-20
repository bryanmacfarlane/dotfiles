function dot_help() {
    echo
    local files_help_path="${DOT_FILES_PATH}/man"
    local priv_help_path="${DOT_PRIV_PATH}/man"

    [ -f "${files_help_path}" ] && cat "${files_help_path}" && echo
    [ -f "${priv_help_path}" ] && cat "${priv_help_path}" && echo
}

function printToolInfo() {
    printf "    %-15s%s\n" "$1" ": $2"
    # | tr ' ~' '- '
}

function dot_tools() {
    echo
    for filename in ${DOT_FILES_PATH}/rc/*.sh; do
        source "${filename}"
    done 
    echo   
}