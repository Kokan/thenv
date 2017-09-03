#!/bin/bash

CONTAINER="ubuntu"
TAG="latest"
NET="bridge"
COMMAND="/thenv/thenv && /thenv/thenv"


getopt --test > /dev/null
if [[ $? -ne 4 ]]; then
    echo "I’m sorry, `getopt --test` failed in this environment."
    exit 1
fi

OPTIONS=i:t:c:n:a
LONGOPTIONS=image:,tag:,command:,net:,all

# -temporarily store output to be able to check for errors
# -activate advanced mode getopt quoting e.g. via “--options”
# -pass arguments only via   -- "$@"   to separate them correctly
PARSED=$(getopt --options=$OPTIONS --longoptions=$LONGOPTIONS --name "$0" -- "$@")
if [[ $? -ne 0 ]]; then
    # e.g. $? == 1
    #  then getopt has complained about wrong arguments to stdout
    exit 2
fi
# use eval with "$PARSED" to properly handle the quoting
eval set -- "$PARSED"

# now enjoy the options in order and nicely split until we see --
while true; do
    case "$1" in
        -i|--image)
            CONTAINER="$2"
            shift 2
            ;;
        -t|--tag)
            TAG="$2"
            shift 2
            ;;
        -n|--net)
            NET="$2"
            shift 2
            ;;
        -c|--command)
            COMMAND="$2 && $COMMAND"
            shift 2
            ;;
        -a|--all)
            print "Run $0"
            $0 --image="dock0/arch" --tag="latest"
            $0 --image="ubuntu"     --tag="16.10"   --command="apt update"
            $0 --image="debian"     --tag="jessie"  --command="apt update"
            $0 --image="centos"     --tag="latest"  --command="yum install -y epel-release"
            exit 0
            ;;
        --)
            shift
            break
            ;;
        *)
            echo "Programming error"
            exit 3
            ;;
    esac
done


docker run           \
 --net=$NET          \
 -ti                 \
 --rm                \
 -v $(pwd):/thenv    \
 $CONTAINER:$TAG \
 sh -c "$COMMAND"

exit $?

