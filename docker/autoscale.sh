#!/usr/bin/env bash

min=$1
max=$2
cpu=$3

source docker/env.sh

if [[ "$min" != "" ]] && [[ "$max" != "" ]] && [[ "$cpu" != "" ]]
then
    kubectl autoscale deployment php-apache --cpu-percent=$cpu --min=$min --max=$max
else
    echo call with arguments: MinNumberOfPods MaxNumberOfPods CPUPercentageToSpawn
fi
