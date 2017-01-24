#!/usr/bin/env bash

num=$1

source docker/env.sh

if [[ "$num" != "" ]]
then
    kubectl scale deployment $IMAGE_ID-deployment --replicas $1
else
    echo call with arguments: NumberOfPods
fi
