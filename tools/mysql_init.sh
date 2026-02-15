export TOOLS_MYSQL_PATH="/usr/local/mysql/bin/"

if [ -d  ${TOOLS_MYSQL_PATH} ]; then    
    if [ ! -x "$(command -v mysql)" ]; then 
        export PATH=$PATH:${TOOLS_MYSQL_PATH}
    fi

    alias mysql-local='mysql -p$(getsec localmysql) -u root'
fi    