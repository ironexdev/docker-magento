#!/bin/sh

export USER_ID=$(id -u)
export GROUP_ID=$(id -u)

docker-compose run --rm --workdir /magento php-fpm composer $@