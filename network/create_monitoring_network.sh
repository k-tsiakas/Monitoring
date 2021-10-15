#!/bin/sh
# Step 1: create network if does not exist

dt=$(date '+%d-%m-%Y %H:%M:%S');

if (($(docker network ls | grep monitoring_network > /dev/null)))
then
  echo "$dt: Network with name:monitoring_network already exists..."
else
  docker network create            \
    --driver=bridge                \
    monitoring_network
  echo "$dt: Network with name:monitoring_network successfully created!"
fi
