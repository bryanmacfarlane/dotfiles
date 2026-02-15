#!/bin/bash -e

info() {
    which mongod
    mongod --version
}

whoami() {
    return
}

install() {
    echo "TODO: implement"
}

"$@"