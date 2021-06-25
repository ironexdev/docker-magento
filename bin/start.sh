#!/bin/sh

export USER_ID=$(id -u)
export GROUP_ID=$(id -u)

# Build images if needed and create and start containers
docker-compose up -d $@