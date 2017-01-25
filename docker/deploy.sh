#!/usr/bin/env bash

source docker/env.sh

gcloud container clusters get-credentials $CLUSTER_ID

docker/create_yml.sh

kubectl apply -f docker/service.yml

echo $(( $(cat docker/version) + 1)) > docker/version
