#!/bin/bash -e 

SCRIPT_DIR="$( cd "$( dirname "$0" )" && pwd )"
. $SCRIPT_DIR/common.sh

# echo
echo -n -e "\033]0;Dev Environment\007"
echo
dot_section "Dev Environment"
dot_message "Welcome" "${USER}!"
echo 
dot_message "Workspaces" "${DOT_WORKSPACE_PATH}"
