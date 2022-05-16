#!/bin/bash -e

info() {
	if [ -f ${TOOL_NODE_PATH} ]; then
		printf "node: %s\n" "$(node --version)"
	else 
		echo "Node not installed"
	fi

	npmPath=`which npm`
	if [ -f ${npmPath} ]; then
		printf "npm: %s\n" "$(npm --version)"
	else
		echo "NPM not installed"
	fi
}

whoami() {
	if [ -f ${nodePath} ]; then
		npm whoami
	fi
}

install() {
    brew install "node@${NODE_VERSION}"
}

"$@"