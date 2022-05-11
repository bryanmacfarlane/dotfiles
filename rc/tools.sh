
function printToolInfo() {
    printf "    %-15s%s\n" "$1" ": $2"
    # | tr ' ~' '- '
}

function dot_tool_versions() {
    echo
    for filename in ${DOT_FILES_PATH}/tools/*.sh; do
        file="${filename##*/}"
        tool="${file%.sh}"
        func="dot_${tool}_version"
        eval "$func"
    done    
    echo
}

function dot_tool_whoami() {
    echo
    echo "Who am I? ..."
    for filename in ${DOT_FILES_PATH}/tools/*.sh; do
        file="${filename##*/}"
        tool="${file%.sh}"
        func="dot_${tool}_whoami"
        eval "$func"
    done    
    echo
}