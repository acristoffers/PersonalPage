#!/usr/bin/env bash

export PROJECT_ID=acristoffers-me
export CLUSTER_ID=acristoffers-me
export IMAGE_ID=personal-page
export IMAGE_VERSION=v$(cat docker/version)
export STATIC_IP=130.211.132.98

export IMAGE_TAG=gcr.io/$PROJECT_ID/$IMAGE_ID:$IMAGE_VERSION

export CLOUDSDK_CONTAINER_USE_CLIENT_CERTIFICATE=True
