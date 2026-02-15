
export TOOL_GO_PATH="/usr/local/go/bin"
export TOOL_GO_BIN="$HOME/go/bin"

if [ -d ${TOOL_GO_PATH} ]; then
    # -x tests for execute permission and exists 
    if [ ! -x "$(command -v go)" ]; then 
        echo "Adding go to PATH"
        pathappend "${TOOL_GO_PATH}"
        # export PATH=$PATH:${TOOL_GO_PATH}
    fi

    if [ -d "${TOOL_GO_BIN}" ]; then
        pathappend "${TOOL_GO_BIN}"
        # export PATH=$PATH:${TOOL_GO_BIN}
    fi
fi
