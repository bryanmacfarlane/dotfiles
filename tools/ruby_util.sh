#!/bin/bash -e

info() {
	if [ -x "$(command -v rbenv)" ]; then
    	rbenv version
	fi
	if [ -x "$(command -v ruby)" ]; then
    	ruby --version
	fi

	# curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash
	if [ -x "$(command -v rails)" ]; then
        rails --version
	fi
}

whoami() {
    return
}

install() {
    echo "TODO: implement"
}

"$@"