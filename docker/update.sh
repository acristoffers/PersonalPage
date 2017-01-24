#!/usr/bin/env bash

source docker/env.sh

kubectl set image deployment/$IMAGE_ID-deployment $IMAGE_ID=$IMAGE_TAG
