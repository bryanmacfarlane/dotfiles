#!/bin/bash -e

if [ "$(uname)" = "Linux" ]; then 
    # https://docs.github.com/en/authentication/connecting-to-github-with-ssh/working-with-ssh-key-passphrases#auto-launching-ssh-agent-on-git-for-windows
    env=~/.ssh/agent.env

    agent_load_env () { 
        test -f "$env" && . "$env" >| /dev/null ; 
    }

    agent_start () {
        (umask 077; ssh-agent >| "$env")
        . "$env" >| /dev/null ; 
    }

    agent_load_env

    # agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2=agent not running
    agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)

    if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
        echo Adding ssh identity
        agent_start
        ssh-add ~/.ssh/id_ed25519
    elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
        echo Adding ssh identity
        ssh-add ~/.ssh/id_ed25519
    fi

    unset env
fi