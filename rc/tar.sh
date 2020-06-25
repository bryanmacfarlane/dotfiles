
# $1 name
# $2 path
function dot_targz() {
    pushd "${2}" > /dev/null
    tar -c -z -f ~/Packages/$1.tar.gz --strip-components=1 .
    popd > /dev/null
}

function dot_untargz() {
    tar xzf $1
}