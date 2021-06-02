


mongodPath=`which mongod`
if [ -f ${mongodPath} ]; then
    dbPath="~/data/mongodb";
    if 
    alias mongod="ulimit -n 1024 && sudo mongod --dbpath ~/data/mongodb"
fi

function dot_mongod_version() {
	if [ -f ${mongodPath} ]; then
		printToolInfo 'mongod' mongodPath
	fi
}

function dot_mongod_whoami() {

}