#!/bin/bash -e

SCRIPT_DIR="$( cd "$( dirname "$0" )" && pwd )"
. $SCRIPT_DIR/common.sh

assert() {
    if [ ! -f "${DOT_TOOLS_PATH}/${1}.sh" ]; then 
        echo "Tool not found: $1"
        exit 1
    fi
}

info() {
    assert "$1"
    "${DOT_TOOLS_PATH}/${1}.sh" "info"
}

install() {
    assert "$1"
    "${DOT_TOOLS_PATH}/${1}.sh" "install"
} 

whoami() {
    assert "$1"
    "${DOT_TOOLS_PATH}/${1}.sh" "whoami"
}

ls() {
    count=$(find "${DOT_TOOLS_PATH}" -name "*.sh" | wc -l)
    if [ $count -eq 0 ]; then return; fi

    echo 
    dot_section "Tools"
    echo
    # echo 
    for file in ${DOT_TOOLS_PATH}/*.sh; do
        file_name="$(basename -s .sh $file)"
        cprint "  🔹  $file_name\n" "white" "intense";
    done

    echo
    echo
    dot_message "tools info <name>" "tool info like version path"
    echo
    dot_message "tools install <name>" "install the tool"
    echo
    dot_message "tools whoami <name>" "logged in as for the the tool"
    echo 
}

"$@"