#!/bin/bash -e

go_path="/usr/local/go/bin"
go_bin="$HOME/go/bin"

init() {
    if [ -d  ${go_path} ]; then
        if [ ! -x "$(command -v go)" ]; then 
            echo "Adding go to PATH"
            export PATH=$PATH:${go_path}
        fi

        if [ -d ${go_bin} ]; then
            export PATH=$PATH:${go_bin}
        fi
    fi
}

info() {
    if [ -d  ${go_path} ]; then
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