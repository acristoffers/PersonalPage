#!/usr/bin/env bash

git pull
docker build -t personal-page .
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
docker run -d -p 80:80 -p 443:443 -t personal-page
docker rmi $(docker images | grep "^<none>" | awk '{print $3}')
