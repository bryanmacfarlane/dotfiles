mysql_path="/usr/local/mysql/bin/"

if [ -d  ${mysql_path} ]; then    
    if [ -x "$(command -v mysql)" ]; then 
        echo found "$(command -v mysql)"
    else 
        echo "Adding mysql to PATH"
        export PATH=$PATH:${mysql_path}
    fi

    alias mysql-local='mysql -p$(getsec localmysql) -u root'
fi

function dot_mysql_version() {
    if [ -x "$(command -v mysql)" ]; then 
        # echo found "$(command -v mysql)"
		printToolInfo 'mysql' $(mysql --version)
	fi
}