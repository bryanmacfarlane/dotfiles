#!/bin/bash -e

mysql_path="/usr/local/mysql/bin/"

init() {
    return 
}

setup() {
    if [ -d  ${mysql_path} ]; then    
        if [ -x "$(command -v mysql)" ]; then 
            echo found "$(command -v mysql)"
        else 
            echo "Adding mysql to PATH"
            export PATH=$PATH:${mysql_path}
        fi

        alias mysql-local='mysql -p$(getsec localmysql) -u root'
    fi    
}

info() {
    if [ -d  ${mysql_path} ]; then  
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