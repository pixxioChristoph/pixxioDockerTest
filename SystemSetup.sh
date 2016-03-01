#!/bin/bash

docker build -t mysql5.5:basic ./mysql5.5
docker build -t myapache:basic ./apache
docker-compose up -d
