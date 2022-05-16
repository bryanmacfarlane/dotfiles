#!/bin/bash -e

SCRIPT_DIR="$( cd "$( dirname "$0" )" && pwd )"
. $SCRIPT_DIR/common.sh

toolsDir() {
    pushd "${SCRIPT_DIR}/../tools"
}

assert() {
    if [ ! -f "${1}.sh" ]; then 
        echo "Tool not found: $1"
        exit 1
    fi    
}

info() {
    toolsDir
    assert "$1"
    "./${1}.sh" "info"
}

init() {
    toolsDir 

    for file in ./*.sh; do
        file_name="$(basename -s .sh $file)"
        # echo "./${file_name}.sh init" 
        "./${file_name}.sh" "init" 
    done
}

ls() {
    toolsDir

    count=$(find . -name "*.sh" | wc -l)
    if [ $count -eq 0 ]; then return; fi

    echo 
    dot_section "Tools"
    echo
    # echo 
    for file in ./*.sh; do
        file_name="$(basename -s .sh $file)"
        cprint "  🔹  $file_name\n" "white" "intense";
    done

    echo
    echo
    dot_message "tool info <name>" "tool info like version path"
    echo
    dot_message "tool install <name>" "install the tool"
    echo
    dot_message "tool whoami <name>" "logged in as for the the tool"
    echo 
}

if [ "$#" -eq 0 ]; then 
    ls
else 
    "$@"
fi 