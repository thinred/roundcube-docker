#!/bin/bash

PORT=${PORT:-8081}

# determine the docker executable name
if which docker; then DOCKER='docker'
else DOCKER='docker.io' ; fi # debian default

# make output verbose
set -o xtrace -o nounset 

# 0. Create roundcube-data container to host only data
sudo $DOCKER ps -a | grep roundcube-data
if [ "$?" -ne 0 ] ; then 
    sudo $DOCKER run -v /rc --name roundcube-data busybox mkdir -p /rc
fi

# 1. Create image with roundcube
sudo $DOCKER build -t thinred/roundcube ./roundcube

# 2. Start it and attach rc-data volumes
sudo $DOCKER run -p 127.0.0.1:$PORT:80 --volumes-from roundcube-data -d --name roundcube thinred/roundcube
