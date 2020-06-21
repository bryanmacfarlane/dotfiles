#!/bin/bash

# set -e 

# call to reload
function dot_load() {
    # load private first so secrets are set before we load
    local priv_env="${DOT_PRIV_PATH}/common/env.sh"
    if [ -f "${priv_env}" ]; then
        source "${priv_env}"

        # load private scripts
        for filename in ${DOT_PRIV_PATH}/rc/_*.sh; do
            source "${filename}"
        done

        local priv_sec="${DOT_PRIV_PATH}/common/secrets.sh"
        [ -f "${priv_sec}" ] && source "${priv_sec}"
    else
        echo "skipping private. ${priv_env} does not exist"
    fi

    [ ! -d "${DOT_FILES_PATH}" ] && >&2 echo "${DOT_FILES_PATH} missing" && return 1

    source "${DOT_FILES_PATH}/common/env.sh"

    # load public scripts
    for filename in ${DOT_FILES_PATH}/rc/_*.sh; do
        source "${filename}"
    done
}

function dot_load_tools() {
    echo
    echo Configuring tools ...
    # load tools
    for filename in ${DOT_FILES_PATH}/tools/*.sh; do
        source "${filename}"
    done    
}