
[[ "${DOT_COMMON:-""}" == "loaded" ]] && return 0
DOT_COMMON=loaded

function fail()
{
   rc=$?
   echo 
   echo "❌ $1 (last rc: ${rc})" >&2
   echo
   exit 1
}

pushd () {
    command pushd "$@" > /dev/null
}

popd () {
    command popd "$@" > /dev/null
}

cprint() {
    # https://stackoverflow.com/a/64824268/775184
    intense='1'
    under='4'

    # Regular Colors
    black='30'        # Black
    red='31'          # Red
    green='32'        # Green
    yellow='33'       # Yellow
    blue='34'         # Blue
    purple='35'       # Purple
    cyan='36'         # Cyan
    white='37'        # White

    # Background
    onblack='40'       # Black
    onred='41'         # Red
    ongreen='42'       # Green
    onyellow='43'      # Yellow
    onblue='44'        # Blue
    onpurple='45'      # Purple
    oncyan='46'        # Cyan
    onwhite='47'       # White

    msg=$1
    shift

    codes="\033["
    for ((i=1; i<=$#; i++))
    do
        # bash: id=${!i}
        id=${(P)i}

        # bash: codes="${codes}${!id}"
        codes="${codes}${(P)id}"

        if [ $i -ne $# ]; then
            codes="${codes};"
        fi
    done
    codes="${codes}m"

    # echo "${codes}"

    printf "${codes}${msg}\033[0m"
}

dot_section() {
    printf "\n "
    cprint "${1}" "white" "intense"
    if [ "$2" ]; then 
        printf " : $2"
    fi
    echo
}

dot_message() {
    cprint "${1}" "white" "intense"
    if [ "$2" ]; then 
        printf " $2"
    fi
    printf "\n"
}

dot_man() {    
    cmd="$(printf "    %-15s" "${1}")"
    cprint "$cmd" "cyan" "intense"
    cprint "$2\n"

    if [ "$3" ]; then
        eg="$(printf "    %-18s%s" "" "( e.g. $3 )")"
        cprint "$eg\n" "grey"
    fi
}
