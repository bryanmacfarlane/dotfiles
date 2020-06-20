
[ ! $(which rbenv) ] || {
	eval "$(rbenv init -)"
}

function dot_ruby_version() {
    printToolInfo 'rbenv' $(rbenv version)
    printToolInfo 'ruby' $(ruby --version)

	# curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash
	[ ! $(which rails) ] || {
        printToolInfo 'rails' $(rails --version)
	}
}