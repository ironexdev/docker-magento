#!/bin/sh

export USER_ID=$(id -u)
export GROUP_ID=$(id -u)

# Run Composer command
docker-compose run --rm --workdir /home/dockeruser/magento php-fpm composer $@