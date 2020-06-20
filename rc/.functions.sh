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