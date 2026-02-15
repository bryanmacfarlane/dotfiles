#!/bin/bash -e

if [ -x "$(command -v mongod)" ]; then
    dbPath="${HOME}/data/mongodb";
    mkdir -p ${dbPath}
    alias mongod="ulimit -n 1024 && sudo mongod --dbpath ${dbPath}"
fi
