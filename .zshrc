DOT_FILES_PATH="${HOME}/Projects/dotfiles"
DOT_PRIV_PATH="${HOME}/Projects/dotprivate"

source "${DOT_FILES_PATH}/common/load.sh"

clear
echo
echo -n -e "\033]0;Dev Environment\007"
echo Mac OS Dev Environment
echo Welcome ${USER}!
echo

# https://scriptingosx.com/2019/07/moving-to-zsh-06-customizing-the-zsh-prompt/
PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%F{250}%1~%f%b %(!.#.$) '

dot_load
dot_help
echo

p
