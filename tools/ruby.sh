
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
	if [ -x "$(command -v rails)" ]; then
        printToolInfo 'rails' "$(rails --version)"
	fi
}

function dot_ruby_whoami() {
	# TODO
}