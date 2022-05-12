#!/bin/zsh

SCRIPT_DIR="$( cd "$( dirname "$0" )" && pwd )"
. $SCRIPT_DIR/common.sh

# echo
echo -n -e "\033]0;Dev Environment\007"
echo
dot_message "Dev Environment"
dot_message "Welcome" "${USER}!"
dot_section "Workspaces" "${DOT_WORKSPACE_PATH}"
