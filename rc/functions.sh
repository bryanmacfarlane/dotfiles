function dot_help() {
    echo
    ${DOT_FILES_PATH}/dot/man.sh
    # local files_help_path="${DOT_FILES_PATH}/man"
    local priv_help_path="${DOT_PRIV_PATH}/man"

    # [ -f "${files_help_path}" ] && cat "${files_help_path}" && echo
    [ -f "${priv_help_path}" ] && cat "${priv_help_path}" && echo
}

export DOT_CFG_PATH="${HOME}/.dotfiles"
export DOT_KEY_PATH="${DOT_CFG_PATH}/secrets.key"

# https://superuser.com/a/1270210

function dot_ensure_key() {
    if [ ! -d "${DOT_PRIV_PATH}" ]; then
        echo "Private repo for storing encrypted secrets does not exist @ ${DOT_PRIV_PATH}"
        echo "Create to use this command"
        return 1
    fi

    if [ ! -f "${DOT_KEY_PATH}" ]; then
        echo "${DOT_KEY_PATH} does not exist.  see instructions in dotprivate/secrets"
        # echo "${DOT_KEY_PATH} does not exist.  creating.  make sure you backup and save"
        # mkdir -p "${DOT_CFG_PATH}"
        # openssl genrsa -out "${DOT_KEY_PATH}" 2048    
    fi
}

# $1 secret name
# $2 secret value
function dot_set_secret() {
    : ${1?"secret name required as first arg"}
    : ${2?"secret value required as second arg"}

    dot_ensure_key
    local secpath="${DOT_PRIV_PATH}/secrets/${1}.dat"
    echo "${2}" | openssl rsautl -inkey "${DOT_KEY_PATH}" -encrypt > "${secpath}"
    echo "created in ${secpath}"
}

# $1 secret name
function dot_get_secret() {
    : ${1?"secret name required as first arg"}

    dot_ensure_key
    mkdir -p "${DOT_PRIV_PATH}/secrets"

    if [ ! -f "${DOT_PRIV_PATH}/secrets/${1}.dat" ]; then 
        echo ""
        return
    fi

    openssl rsautl -inkey "${DOT_KEY_PATH}" -decrypt < "${DOT_PRIV_PATH}/secrets/${1}.dat"
}

function dot_list_secrets() {
    for entry in "${DOT_PRIV_PATH}/secrets"/*.dat
    do
        file=${entry##*/}
        echo ${file%.*}
    done    
}