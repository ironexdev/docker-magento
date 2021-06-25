#!/bin/sh

export USER_ID=$(id -u)
export GROUP_ID=$(id -u)

# Stop running containers, remove images and volumes
sh bin/stop.sh -v --rmi all

# Remove stopped containers
docker-compose rm