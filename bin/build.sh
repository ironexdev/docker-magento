#!/bin/sh

export USER_ID=$(id -u)
export GROUP_ID=$(id -u)

# Build images
docker-compose build $@