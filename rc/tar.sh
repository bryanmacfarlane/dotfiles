
# $1 name
# $2 path
function dot_targz() {
    # set -e
    local tgt="~/Packages/$1.tar.gz"
    mkdir -p ~/Packages
    pushd "${2}" > /dev/null
    tar -c -z -f "${tgt}" --strip-components=1 .
    echo "Created ${tgt}"
    popd > /dev/null
}

function dot_untargz() {
    tar xzf $1
}