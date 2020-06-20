
export DOT_FILES="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

echo
echo "Caution, this will link profile and dotfiles in home."
read -p "Continue? " -n 1 -r
echo

# symlink 
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo
    rm "${DOT_FILES}/.DS_Store"

    for filename in ${DOT_FILES}/.*; do
        if [ -f ${filename} ]; then
            echo "   linking ${filename}"
            ln -sf "${filename}" "${HOME}"
        fi
    done
    echo    
fi