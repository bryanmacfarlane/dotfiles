# tools

Create scripts per tool to manage

## <tool>_init

Sourced into the current zshell.  Set up paths and any variables needed.

## <tool>.sh

Functions to provide tool info (versions, where installed, shell completions etc) and username logged in as.

These are not sourced into the shell.  They are executed in a new shell

```shell
info() {
    # echo verions, where installed, etc
    echo
    echo toolname --version
    which toolname
}

whoami() {
    # echo who you are logged in as
    return
}

install() {
    # scripts to install on macos or linux
    return
}
```

