#!/bin/bash

set -e

export DOT_FILES="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

echo "Installing dotfiles from $DOT_FILES"

rm "${DOT_FILES}/.DS_Store"  >/dev/null 2>&1 || true

for filename in ${DOT_FILES}/.*; do
    if [ -f ${filename} ]; then
        echo "   linking ${filename}"
        ln -sf "${filename}" "${HOME}"
    fi
done

sudo chsh -s "$(which zsh)" "$(whoami)"
