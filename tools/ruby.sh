
if [ -x "$(command -v rbenv)" ]; then
	eval "$(rbenv init -)"
fi

function dot_ruby_version() {
	if [ -x "$(command -v rbenv)" ]; then
    	printToolInfo 'rbenv' $(rbenv version)
	fi
	if [ -x "$(command -v ruby)" ]; then
    	printToolInfo 'ruby' "$(ruby --version)"
	fi

	# curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash
	[ ! $(which rails) ] || {
        printToolInfo 'rails' $(rails --version)
	}
}

function dot_ruby_whoami() {
	# TODO
}