
NODE_VERSION=16
NODE_BREW_PATH=/usr/local/opt/node@16/bin
if [ -d "${NODE_BREW_PATH}" ]; then 
	PATH="$NODE_BREW_PATH:$PATH"
fi

nodePath=`which node`
if [ -f ${nodePath} ]; then
	alias n="node $@"
	alias nd="node --debug=5858 $@"
	alias ndb="node --debug-brk=5858 $@"
	alias ni="open http://localhost:8080/debug?port=5858 && node-inspector"	
fi

function dot_node_version() {
	if [ -f ${nodePath} ]; then
		printToolInfo 'node' $(node --version)
	fi

	npmPath=`which npm`
	if [ -f ${nodePath} ]; then
		printToolInfo 'npm' $(npm --version)
	fi
}

function dot_node_whoami() {
	if [ -f ${nodePath} ]; then
		whoami=$(npm whoami)
		printToolInfo 'npm' "$whoami"
	fi	
}