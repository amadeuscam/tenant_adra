#!/bin/bash

sudo kill -9 $(sudo lsof -t -i:80)
sudo kill -9 $(sudo lsof -t -i:8080)

docker stop $(docker ps -a -q)
docker-compose -p RA -f docker-compose-dev_traefik.yml up