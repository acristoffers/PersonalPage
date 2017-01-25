#!/usr/bin/env bash

source docker/env.sh

kubectl set image deployment/$IMAGE_ID-deployment $IMAGE_ID=$IMAGE_TAG

# bump version
echo $(( $(cat docker/version) + 1)) > docker/version
