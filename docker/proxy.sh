#!/usr/bin/env bash

source docker/env.sh

gcloud container clusters get-credentials $CLUSTER_ID

kubectl proxy
