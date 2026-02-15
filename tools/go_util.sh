#!/bin/bash -e

info() {
    if [ -d  ${TOOL_GO_PATH} ]; then
        which go 
        go version 
    else 
        echo "Not installed"
    fi 
}

whoami() {
    return
}

install() {
    echo "TODO: implement"
}

"$@"