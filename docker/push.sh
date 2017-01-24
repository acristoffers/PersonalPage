#!/usr/bin/env bash

source docker/env.sh

gcloud docker -- push $IMAGE_TAG
