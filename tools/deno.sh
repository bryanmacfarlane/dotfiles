#!/bin/zsh -e

denoPath=`which deno`

init() {
    if [ -f ${denoPath} ]; then
        echo "TODO: fix"
        #deno completions zsh > ~/.zsh/_deno
    fi 
}

info() {
    if [ -f ${denoPath} ]; then
        which deno
        deno --version
    fi 
}

whoami() {
    return
}

install() {
    echo "TODO: implement"
}

"$@"
