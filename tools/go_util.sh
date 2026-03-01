#!/usr/bin/env bash
set -e

GO_VERSION=1.26.0
os=$(uname -s | tr "[:upper:]" "[:lower:]")
source=https://go.dev/dl

arch=$(uname -m)
case "$arch" in
    i*)
        arch=386
        ;;
    x*)
        arch=amd64
        ;;
    aarch64)
        #arch=armv6l
        arch=arm64
        ;;
    armv7l)
        # Go project does not provide a binary release for armv71
        msg armv7l is not supported, using armv6l
        arch=armv6l
        ;;
esac

label=go${GO_VERSION}.$os-$arch
filename=$label.tar.gz
url=$source/$filename

info() {
    if [ -d  ${TOOL_GO_PATH} ]; then
        which go
        go version
    else
        echo "Not installed"
    fi
}

whoami() {
    return
}

installLinux() {

    echo
    echo "Installing ${GO_VERSION} ..."
    if [[ -d "/usr/local/go" ]]; then
        echo removing previous version
        sudo rm -rf /usr/local/go
    fi

    tmpPath="/tmp/$filename"
    echo "Downloading $url to $tmpPath ..."
    curl --connect-timeout 5 -L -o "$tmpPath" "$url"

    echo
    echo "Installing ..."
    sudo tar -C /usr/local -xzf "$tmpPath" #go${GO_VERSION}.linux-amd64.tar.gz
    echo

    echo "Cleaning up ..."
    rm $tmpPath || true
}

install() {
    which curl

    if [ "$(uname)" = "Linux" ]; then
        installLinux
    elif [ "$(uname)" = "Darwin" ]; then
        echo "TODO: implement"
    fi

    info
    echo "done"
}

"$@"
