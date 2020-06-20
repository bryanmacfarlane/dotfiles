
export DOT_FILES="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

echo
echo "Caution, this will link profile and dotfiles in home."
read -p "Continue? " -n 1 -r
echo

# symlink 
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo
    for filename in ${DOT_FILES}/home/.*; do
        echo $filename
        if [ -f ${filename} ]; then
            echo "   linking ${filename}"
            ln -sf "${filename}" "${HOME}"
        fi
    done
    echo    
fi