go_path="/usr/local/go/bin"
go_bin="$HOME/go/bin"

if [ -d  ${go_path} ]; then    
    if [ -x "$(command -v go)" ]; then 
        echo found "$(command -v go)"
    else 
        echo "Adding go to PATH"
        export PATH=$PATH:${go_path}
    fi

    if [ -d ${go_bin} ]; then
        export PATH=$PATH:${go_bin}
    fi
fi

function dot_go_version() {
	if [ -f ${go_in_path} ]; then
		printToolInfo 'go' $(go version)
	fi
}