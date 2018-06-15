#!/usr/bin/env bash

# get all running docker container names
containers=$(sudo docker ps | awk '{if(NR>1) print $NF}')
host=$(hostname)

# loop through all containers
for container in $containers
do
  ip=$( docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $container )
  echo "Container: $container $ip"
done
