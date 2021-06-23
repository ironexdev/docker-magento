#!/bin/sh

docker-compose down

docker container rm $(docker container ls -aq)

docker image rm $(docker image ls -aq) --force

echo "###### docker container ls -a"

docker container ls -a

echo "###### docker image ls"

docker image ls