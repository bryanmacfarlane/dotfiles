#!/bin/bash -e

mongodPath=`which mongod`

init() {
    if [ -f ${mongodPath} ]; then
        dbPath="${HOME}/data/mongodb";
        if [ -d "" ]; then 
            alias mongod="ulimit -n 1024 && sudo mongod --dbpath ${HOME}/data/mongodb"
        fi 
    fi
}

function dot_mongod_version() {
	if [ -f ${mongodPath} ]; then
		printToolInfo 'mongod' mongodPath
	fi
}

info() {
    return
}

whoami() {
    return
}

install() {
    echo "TODO: implement"
}

"$@"