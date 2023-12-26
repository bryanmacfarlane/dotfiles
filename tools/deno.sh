#!/bin/zsh -e

info() {
    if [ -x "$(command -v deno)" ]; then 
        echo 
        deno --version
        which deno
        echo 
    else 
        echo "Not installed or not in PATH"
    fi
}

whoami() {
    return
}

install() {    
    curl -fsSL https://deno.land/x/install/install.sh | sh
}

"$@"
