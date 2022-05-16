#!/bin/zsh

# call to reload
function dot_load() {
    # load private first so secrets are set before we load
    local priv_env="${DOT_PRIV_PATH}/common/env.sh"
    if [ -f "${priv_env}" ]; then
        source "${priv_env}"

        # load private scripts
        for filename in ${DOT_PRIV_PATH}/rc/*.sh; do
            source "${filename}"
        done
    else
        echo "skipping private. ${priv_env} does not exist"
    fi

    [ ! -d "${DOT_FILES_PATH}" ] && >&2 echo "${DOT_FILES_PATH} missing" && return 1

    # source "${DOT_FILES_PATH}/common/env.sh"

    # load public scripts
    for filename in ${DOT_FILES_PATH}/rc/*.sh; do
        source "${filename}"
    done

    # # load secrets
    local priv_sec="${DOT_PRIV_PATH}/common/secrets.sh"
    if [ -f "${priv_sec}" ]; then
        source "${priv_sec}"
    fi
}
