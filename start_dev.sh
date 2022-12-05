#!/bin/bash

docker kill $(docker ps -q)
sudo lsof -t -i:80 | xargs sudo kill -9
docker-compose -f docker-compose-dev_traefik.yml up