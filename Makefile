#!/bin/bash

PROJECT_NAME := app
TEMPLATE := --template typescript
IMAGE_NAME := maxi3390/react:latest
USER_IDS := $(shell id -u):$(shell id -g)
CONTAINER_NAME := reactapp

#https://github.com/mswag/docker-ionic/blob/develop/Dockerfile

image:
	docker-compose build

create-project:
	docker run --rm --user="${USER_IDS}" -v $(PWD):/app ${IMAGE_NAME} npx create-react-app ${PROJECT_NAME} ${TEMPLATE}

sh:
	docker-compose exec ${CONTAINER_NAME} sh

start:
	docker-compose up

startd:
	docker-compose up -d

stop:
	docker-compose stop

yarn-first-install:
	docker run --rm --user="${USER_IDS}" -v $(PWD)/app:/app ${IMAGE_NAME} yarn install

# build:
# 	docker-compose exec ionicapp ionic build

# help:
# 	docker run --rm -v $(PWD):/app ${IMAGE_NAME} ionic help serve

# yarn-first-install:
# 	docker run --rm -v $(PWD)/app:/app ${IMAGE_NAME} yarn install

# yarn-install:
# 	docker-compose exec ionicapp yarn install

# yarn-build:
# 	docker run --rm -v $(PWD)/app:/app ${IMAGE_NAME} yarn build

# yarn-test:
# 	docker run --rm -v $(PWD)/app:/app ${IMAGE_NAME} yarn test --watchAll=false
