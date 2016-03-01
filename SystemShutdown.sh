#!/bin/bash

docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)

docker rmi $(docker images -q mysql5.5)
docker rmi $(docker images -q myapache)
#docker rmi $(docker images -q)


