#!/bin/bash -e

# install brew if not installed
# we can install most other things using brew afterwards

info() {
    echo.
    brew --version
}

whoami() {
    return
}

install() {
    if [ ! -x "$(command -v brew)" ]; then
        echo "Installing brew ..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        echo
    fi
}

"$@"