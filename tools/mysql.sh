#!/bin/bash -e

info() {
    if [ -d  ${TOOLS_MYSQL_PATH} ]; then  
        which mysql  
        mysql --version
    fi
}

whoami() {
    return
}

install() {
    return 
}

"$@"