#!/usr/bin/make -f

.DEFAULT_GOAL := help
.PHONY: help

PROJECT_NAME := java-graal

clean-docker: ## Removes the Docker image
	if docker image ls | grep "$(PROJECT_NAME)"; then docker image rm -f $(PROJECT_NAME); fi

clean-mn: ## Cleans the micronaut build files
	./gradlew clean

build-docker: ## Builds a Graal native Docker image
	docker build . -t $(PROJECT_NAME)

build-mn: ## Builds the mincronaut application as a .jar
	./gradlew assemble

clean-all: rm-docker clean-docker clean-mn # Cleans all the project build files (Docker image included)

build-native: build-mn build-docker ## Builds a native image

run-docker: ## Runs the docker container
	docker container run -d -p 8080:8080 --name $(PROJECT_NAME) $(PROJECT_NAME)

stop-docker: ## Runs the docker container
	docker container stop $(PROJECT_NAME)

rm-docker: ## Removes the docker container
	if docker container ls -a | grep "$(PROJECT_NAME)"; then docker container rm --force $(PROJECT_NAME); fi

connect-docker: ## Removes the docker container
	if docker container ls -a | grep "$(PROJECT_NAME)"; then docker exec -it $(PROJECT_NAME) sh; fi

help: ## Display this help text
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
