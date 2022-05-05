export DOT_FILES_PATH=$(dirname $(readlink ~/.zshrc))
export DOT_PRIV_PATH="${DOT_FILES_PATH}/../dotprivate"


# get rid of the dots
# https://stackoverflow.com/a/27756399/775184
DOT_PRIV_PATH=$(cd ${DOT_PRIV_PATH} && pwd)

clear
source "${DOT_FILES_PATH}/common/load.sh"
echo
echo -n -e "\033]0;Dev Environment\007"
echo Dev Environment
echo Welcome ${USER}!
echo

# https://scriptingosx.com/2019/07/moving-to-zsh-06-customizing-the-zsh-prompt/
PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%F{250}%1~%f%b %(!.#.$) '

dot_load
dot_help
dot_load_tools
echo

w
