

dot_tools_info() {
    "${DOT_DOT_PATH}/tools.sh" "info" "$1"
}

dot_tools_install() {
    "${DOT_DOT_PATH}/tools.sh" "install" "$1"
}

dot_tools_whoami() {
    "${DOT_DOT_PATH}/tools.sh" "whoami" "$1"
}

dot_tools_init() {
    for file in ${DOT_TOOLS_PATH}/*_init; do
        file_name="$(basename $file)"
        source "${DOT_TOOLS_PATH}/${file_name}" 
    done
}

dot_tools_ls() {
    "${DOT_DOT_PATH}/tools.sh" "ls" 
}

dot_tools() {
    cmd=$1
    if [ "$cmd" ]; then 
        shift 
        "dot_tools_$cmd" "$@"

        # reload tools env and paths
        if [ "$cmd" != "init" ]; then 
            dot_tools_init
        fi
    else
        dot_tools_ls
    fi 
}
