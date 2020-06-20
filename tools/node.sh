export NVM_DIR="$HOME/.nvm"
if [ -d ${NVM_DIR} ]; then
	[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
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