
alias help="dot_help"
alias all="echo;alias;echo"
alias c="tput reset"

# Reload the shell (i.e. invoke as a login shell)
alias reload="dot_reload"
alias tools="dot_tools $@"
alias me="dot_tool_whoami"
alias setsec="dot_set_secret"
alias getsec="dot_get_secret"
alias lssec="dot_list_secrets"
alias tz="dot_targz"
alias utz="dot_untargz"

# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"

# Shortcuts
alias dl="pushd ~/Downloads > /dev/null"
alias dt="pushd ~/Desktop > /dev/null"
alias w="pushd ${DOT_WORKSPACE_PATH} > /dev/null"
alias s="pushd ~/Study > /dev/null"
alias pkg="pushd ~/Packages > /dev/null"

# Common Projects
alias dotfiles="pushd ~/Projects/dotfiles > /dev/null"

# List all files colorized in long format
alias l="ls -la"

# git
alias g="git"
alias gc="git commit -a -m $@"
alias gs="git status"
alias ga="git add $@"
alias gr="git remote -v"
alias gpsh="git push origin $@"
alias gpshm="git push origin master"
alias gpll="git pull origin $@"
alias gpllm="git pull origin master"
alias gcom="git checkout master"
# undo local commits
# https://stackoverflow.com/a/927386/775184
alias gulast="git reset HEAD~"
# revert local changes
alias greset="git reset --hard"

alias grestore="git restore ."



# Trim new lines and copy to clipboard
# echo "hello world" | cb
alias cb="tr -d '\n' | pbcopy"

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# Canonical hex dump; some systems have this symlinked
command -v hd > /dev/null || alias hd="hexdump -C"

# macOS has no `md5sum`, so use `md5` as a fallback
command -v md5sum > /dev/null || alias md5sum="md5"

# macOS has no `sha1sum`, so use `shasum` as a fallback
command -v sha1sum > /dev/null || alias sha1sum="shasum"

# network
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
alias ifactive="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"