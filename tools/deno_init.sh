#!/bin/bash -e

DENO_PATH="${HOME}/.deno/bin/"

if [ -d ${DENO_PATH} ]; then
    pathappend "${DENO_PATH}"
    # TODO: fix
    # deno completions zsh > ~/.zsh/_deno
fi
