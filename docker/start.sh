#!/usr/bin/env bash

source docker/env.sh

docker run -d -p 80:80 -p 443:443 --name $IMAGE_ID $IMAGE_TAG
