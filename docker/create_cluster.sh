#!/usr/bin/env bash

source docker/env.sh

gcloud container clusters create $CLUSTER_ID --disk-size=10 --machine-type=f1-micro --num-nodes=3 --zone=us-central1-c
