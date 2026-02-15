#!/bin/bash -e

if [ -x "$(command -v node)" ]; then
    alias n="node $@"
    alias nd="node --debug=5858 $@"
    alias ndb="node --debug-brk=5858 $@"
    alias ni="open http://localhost:8080/debug?port=5858 && node-inspector"
fi
