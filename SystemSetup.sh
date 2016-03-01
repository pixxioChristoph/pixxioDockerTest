#!/bin/bash

docker build -t mysql5.5:basic /root/composetest/mysql5.5
docker build -t myapache:basic /root/composetest/apache
docker-compose up -d
