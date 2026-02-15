#!/bin/bash -e

if [ -x "$(command -v brew)" ]; then
    brewPath="/opt/homebrew/bin"

    if [ "$(uname)" = "Linux" ]; then
        brewPath="/home/linuxbrew/.linuxbrew/bin"
    fi

    if [ -d "${brewPath}" ]; then
        eval "$(${brewPath}/brew shellenv)"
    fi
fi
