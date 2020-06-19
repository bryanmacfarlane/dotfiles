#!/bin/bash

# set -e 

DOT_FILES_PATH="${HOME}/Projects/dotfiles"
DOT_PRIV_PATH="${HOME}/Projects/dotprivate"

# call to reload
function dot_load() {
    # load private first so secrets are set before we load
    local priv_env="${DOT_PRIV_PATH}/.env.sh"
    if [ -f "${priv_env}" ]; then
        source "${priv_env}"

        # load private functions
        for filename in ${DOT_PRIV_PATH}/rc/.*.sh; do
            source "${filename}"
        done        
    else
        echo "skipping private. ${priv_env} does not exist"
    fi

    [ ! -d "${DOT_FILES_PATH}" ] && >&2 echo "${DOT_FILES_PATH} missing" && return 1

    source "${DOT_FILES_PATH}/.env.sh"

    # load public functions
    for filename in ${DOT_FILES_PATH}/rc/.*.sh; do
        source "${filename}"
    done        
}

function dot_help() {
    local files_help_path="${DOT_FILES_PATH}/.man"
    local priv_help_path="${DOT_PRIV_PATH}/.man"

    [ -f "${files_help_path}" ] && cat "${files_help_path}" && echo
    [ -f "${priv_help_path}" ] && cat "${priv_help_path}" && echo
}

clear
echo
echo -n -e "\033]0;Dev Environment\007"
echo Mac OS Dev Environment
echo Welcome ${USER}!
echo

# https://scriptingosx.com/2019/07/moving-to-zsh-06-customizing-the-zsh-prompt/
PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%F{250}%1~%f%b %(!.#.$) '

dot_load
dot_help
echo

p
