go_path="/usr/local/go/bin"
go_in_path=`which go`

if [ -f  ${go_path} ]; then
    echo go installed ...
    
    if ! [ -f ${go_in_path} ]; then 
        echo found ${go_in_path}
    else 
        echo "Adding go to PATH"
        export PATH=$PATH:${go_path}
    fi
fi

function dot_go_version() {
	if [ -f ${go_in_path} ]; then
		printToolInfo 'go' $(go version)
	fi
}