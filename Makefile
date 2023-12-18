#!/usr/bin/make -f
PROJECT_NAME := 'Multitenant Platform'
DOCKER_COMPOSE_FILE := $(shell pwd)/docker-compose-dev_traefik.yml
WEB_SERVICE := web
DOCKER_PROJECT_NAME := ra


dev-start:
	$(shell pwd)/scripts/start_dev.sh

bash:
	docker-compose -p $(DOCKER_PROJECT_NAME) -f $(DOCKER_COMPOSE_FILE) exec  $(WEB_SERVICE) bash

migrate:
	docker-compose -p $(DOCKER_PROJECT_NAME) -f $(DOCKER_COMPOSE_FILE) exec -T $(WEB_SERVICE) python3 manage.py makemigrations
	docker-compose -p $(DOCKER_PROJECT_NAME) -f $(DOCKER_COMPOSE_FILE) exec -T $(WEB_SERVICE) python3 manage.py migrate

build:
	docker-compose -p $(DOCKER_PROJECT_NAME) -f $(DOCKER_COMPOSE_FILE) build --no-cache --pull

test:
	docker-compose -p $(DOCKER_PROJECT_NAME) -f $(DOCKER_COMPOSE_FILE) exec -T $(WEB_SERVICE) pytest -vv