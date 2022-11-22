#!/bin/bash

docker kill $(docker ps -q)
docker-compose -f docker-compose-dev.yml up
