#!/bin/bash -e

if [ -x "$(command -v brew)" ]; then
    brewPath="/opt/homebrew/bin"

    if [ "$(uname)" = "Linux" ]; then
        brewPath="/home/linuxbrew/.linuxbrew/bin"
    fi
    echo "brew: ${brewPath}"

    echo "brew found"
    if [ -d "${brewPath}" ]; then
        echo "brew shellenv"
        eval "$(${brewPath}/brew shellenv)"
        echo "done"
    fi
fi
