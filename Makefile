
IMAGENAME := bitnoize/r-base

.PHONY: help build rebuild

.DEFAULT_GOAL := help

help:
	@echo "Makefile commands: build rebuild"

#build: export BUILD_OPTS := ...
#build: export PUSH_OPTS := ...
build: .build-cran40-bullseye .push-cran40-bullseye

rebuild: export BUILD_OPTS := --pull --no-cache
#rebuild: export PUSH_OPTS := ...
rebuild: .build-cran40-bullseye .push-cran40-bullseye

.build-cran40-bullseye:
	docker build $(BUILD_OPTS) \
		--build-arg CRAN_REPOSITORY=cran40 \
		-t "$(IMAGENAME):cran40-bullseye" \
		-t "$(IMAGENAME):latest" \
		-f Dockerfile.bullseye \
		.

.push-cran40-bullseye:
	docker push $(PUSH_OPTS) "$(IMAGENAME):cran40-bullseye"
	docker push $(PUSH_OPTS) "$(IMAGENAME):latest"

