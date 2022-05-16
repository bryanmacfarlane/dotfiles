#!/bin/zsh -e

denoPath=`which deno`

info() {
    if [ -f ${denoPath} ]; then
        echo 
        deno --version
        which deno
        echo 
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
