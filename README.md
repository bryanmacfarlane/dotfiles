
# ~

## setup

Run setup.sh once.  Creates symlinks in ~

```bash
$ ./setup.sh
```

Note: this is automatically run when [used in a github codespace](https://docs.github.com/en/codespaces/customizing-your-codespace/personalizing-codespaces-for-your-account#dotfiles).

## zsh

```bash
Dev Environment
Welcome bryan!

 Workspaces : /Users/bryan/Projects


 Commands

    help           show this help
    reload         reload shell in same terminal
    c              clear
    all            show all commands

    tools          list tools and versions
    me             who am I for all tools

    setsec         set secret.  e.g. setsec foo "bar baz"
    getsec         get secret.  e.g. getsec foo
    lssec          list secrets.

    tz             targz full dir.  tz <pathToCompress> <outputfile>
                      ( e.g. tz ./tools ./tools.tar.gz )
    utz            extract targz dir. utz <fileToUncompress> <pathUncompressTo>
                      ( e.g. utz ./tools.tar.gz ./tools )

√ Projects $
```