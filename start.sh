#!/bin/bash

set -eux

DOCKER=docker
PORT=${PORT:-8081}

# hack for debian
if which docker.io; then
    DOCKER=docker.io
fi

# 1. Create image with roundcube
$DOCKER build -t roundcube ./roundcube

# 2. Start it
$DOCKER run -p 127.0.0.1:$PORT:80 -d --name roundcube roundcube
