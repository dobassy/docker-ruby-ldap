#!/bin/bash

### Usage for this build shell
# Basic
# $ sh build.sh
#
# If you are using a PROXY server
# $  PROXY_SERVER=http://192.168.your.proxy:8080 sh build.sh
#
# Set tag
# $ sh build.sh arg(TAG number)

IMAGE_NAME=ruby-ldap
REPOSITORY="dobassy/$IMAGE_NAME"

if [[ $PROXY_SERVER ]]; then
  PROXY_ARGS="--build-arg http_proxy=$PROXY_SERVER --build-arg https_proxy=$PROXY_SERVER"
else
  PROXY_ARGS=""
fi

if [ -z $1 ]; then
    # for development
    COMMAND="docker build --rm -t $REPOSITORY $PROXY_ARGS ."
else
    # for production. Set TAG
    COMMAND="docker build --no-cache --rm -t $REPOSITORY:$1 $PROXY_ARGS ."
fi

echo "[INFO] $COMMAND"
exec $COMMAND
