#!/usr/bin/env bash

source docker/env.sh

docker stop $IMAGE_ID
docker rm $IMAGE_ID
