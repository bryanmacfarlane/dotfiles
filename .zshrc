# .zshrc is a symlink to .zshrc in this repo wherever it is cloned on disk
export DOT_FILES_PATH=$(dirname $(readlink ~/.zshrc))
export DOT_DOT_PATH="${DOT_FILES_PATH}/dot"
export DOT_TOOLS_PATH="${DOT_FILES_PATH}/tools"

source "${DOT_FILES_PATH}/dot/load.sh"

# workspaces is either in ~/Projects or in codespaces it's in /codespaces
export DOT_WORKSPACE_PATH="${HOME}/Projects"
if [ -d "/workspaces" ]; then
    # codespaces
    DOT_WORKSPACE_PATH="/workspaces"
fi

export DOT_PRIV_PATH="${DOT_WORKSPACE_PATH}/dotprivate"

clear

"${DOT_FILES_PATH}/dot/welcome.sh"

# https://scriptingosx.com/2019/07/moving-to-zsh-06-customizing-the-zsh-prompt/
PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%F{250}%1~%f%b %(!.#.$) '

dot_load
dot_help

# "${DOT_FILES_PATH}/dot/tools.sh" "init"
# dot_load_tools
# echo
dot_tools "init"

# codespaces automatically takes you into that repo.  
# else, lets start in the root of our workspaces directory (the w alias)
# on reload keep same dir (it writes a .curr file)
if [ -f "${DOT_FILES_PATH}/.curr" ]; then 
    curr_dir=$(cat "${DOT_FILES_PATH}/.curr")
    cd "${curr_dir}"
    rm -rf .curr > /dev/null
elif [ -z "${CODESPACES}" ]; then 
w
fi
