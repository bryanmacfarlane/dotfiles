#!/bin/bash -e
export NODE_VERSION=24

info() {
    if [ -x "$(command -v node)" ]; then
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
    echo "installing node ${NODE_VERSION}..."
    brew install "node@${NODE_VERSION}"
}

"$@"
