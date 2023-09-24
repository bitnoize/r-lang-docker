
IMAGENAME := ghcr.io/bitnoize/r-lang

.PHONY: help build rebuild push pull

.DEFAULT_GOAL := help

help:
	@echo "Makefile commands: build rebuild push pull"

#build: export BUILD_OPTS := ...
build: .build-cran40-bookworm

rebuild: export BUILD_OPTS := --pull --no-cache
rebuild: .build-cran40-bookworm

.build-cran40-bookworm:
	docker build $(BUILD_OPTS) \
		--build-arg CRAN_REPOSITORY=cran40 \
		-t "$(IMAGENAME):cran40-bookworm" \
		-t "$(IMAGENAME):latest" \
		-f Dockerfile.bookworm \
		.

#push: export PUSH_OPTS := ...
push: .push-cran40-bookworm

.push-cran40-bookworm:
	docker push $(PUSH_OPTS) "$(IMAGENAME):cran40-bookworm"
	docker push $(PUSH_OPTS) "$(IMAGENAME):latest"

#pull: export PULL_OPTS := ...
pull: .pull-cran40-bookworm

.pull-cran40-bookworm:
	docker pull $(PULL_OPTS) "$(IMAGENAME):cran40-bookworm"
	docker pull $(PULL_OPTS) "$(IMAGENAME):latest"

