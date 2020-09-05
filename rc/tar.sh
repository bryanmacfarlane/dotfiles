
# $1 path to compress
# $2 output targz file
function dot_targz() {
    tar -C $1 -czv -f $2 .
}

# $1 file to uncompress
# $2 path to uncompress to
# will create the target path if it does not exist
function dot_untargz() {
    mkdir -p $2 && tar -C $2 -xzv -f $1
}