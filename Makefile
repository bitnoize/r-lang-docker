
IMAGENAME := ghcr.io/bitnoize/r-base

.PHONY: help build rebuild push pull

.DEFAULT_GOAL := help

help:
	@echo "Makefile commands: build rebuild push pull"

#build: export BUILD_OPTS := ...
build: .build-cran40-bullseye

rebuild: export BUILD_OPTS := --pull --no-cache
rebuild: .build-cran40-bullseye

.build-cran40-bullseye:
	docker build $(BUILD_OPTS) \
		--build-arg CRAN_REPOSITORY=cran40 \
		-t "$(IMAGENAME):cran40-bullseye" \
		-t "$(IMAGENAME):latest" \
		-f Dockerfile.bullseye \
		.

#push: export PUSH_OPTS := ...
push: .push-cran40-bullseye

.push-cran40-bullseye:
	docker push $(PUSH_OPTS) "$(IMAGENAME):cran40-bullseye"
	docker push $(PUSH_OPTS) "$(IMAGENAME):latest"

#pull: export PULL_OPTS := ...
pull: .pull-cran40-bullseye

.pull-cran40-bullseye:
	docker pull $(PULL_OPTS) "$(IMAGENAME):cran40-bullseye"
	docker pull $(PULL_OPTS) "$(IMAGENAME):latest"

