#!/usr/bin/env bash

source docker/env.sh

echo "If you forgot to bump the version, this is a good time to stop this script."
echo "Or hit enter to continue"
read

docker build -t $IMAGE_TAG .
