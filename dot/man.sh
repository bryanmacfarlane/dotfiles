#!/bin/bash -e

SCRIPT_DIR="$( cd "$( dirname "$0" )" && pwd )"
. $SCRIPT_DIR/common.sh

dot_section "Commands"
echo
dot_man "help" "show this help"
dot_man "reload" "reload shell in same terminal"
dot_man "c" "clear"
dot_man "all" "show all commands"

echo
dot_man "tools" "list tools and info"
dot_man "me" "who am I for all tools"

echo
dot_man "setsec" "set secret.  e.g. setsec foo \"bar baz\""
dot_man "getsec" "get secret.  e.g. getsec foo"
dot_man "lssec" "list secrets."

echo
dot_man "tz" "targz full dir.  tz <pathToCompress> <outputfile>" "tz ./tools ./tools.tar.gz"
dot_man "utz" "extract targz dir. utz <fileToUncompress> <pathUncompressTo>" "utz ./tools.tar.gz ./tools"

