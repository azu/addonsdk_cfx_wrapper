#!/bin/sh

declare addonSDKPath;
declare workspaceDirPath;

usage()
{
    echo "Usage: "${0##*/}" -a 'AddonSDK Dir Path' -w 'package Dir Path'"
    echo ""
    echo "Options:"
    echo " a: AddonSDK dir path"
    echo " w: Specific package dir path'"
    exit 0
}
while getopts a:w:h flag
do
    case $flag in
        a)
            addonSDKPath="$OPTARG"
        ;;
        w)
            workspaceDirPath="$OPTARG"
        ;;
        *)
            usage
        ;;
    esac
done

function loadActive(){
    cd "$1"
    source "$1"bin/activate
}

function run(){
    cfx run
}

loadActive ${addonSDKPath}
cd "${workspaceDirPath}"
run
