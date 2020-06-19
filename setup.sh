
export DOT_FILES="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

echo "Caution, this will overwrite profile and rc files in homw."
read -p "Continue? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    ln -sf "${DOT_FILES}/setup/.zshrc" "${HOME}" 
    #cp -f "${DOT_FILES}/setup/.zshrc" "${HOME}"
fi