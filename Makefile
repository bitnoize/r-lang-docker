
IMAGENAME="bitnoize/r-base"

.PHONY: help build push pull shell

.DEFAULT_GOAL := help

help:
	@echo "Makefile commands: build push pull shell"

build: .build-cran40-bullseye

.build-cran40-bullseye:
	docker build --pull --no-cache \
		-t "$(IMAGENAME):4.2-bullseye" \
		-t "$(IMAGENAME):latest" \
		-f Dockerfile.bullseye \
		.

push: .push-cran40-bullseye

.push-cran40-bullseye:
	docker push "$(IMAGENAME):4.2-bullseye"
	docker push "$(IMAGENAME):latest"

pull: .pull-cran40-bullseye

.pull-cran40-bullseye:
	docker pull "$(IMAGENAME):4.2-bullseye"
	docker pull "$(IMAGENAME):latest"

shell:
	docker run -it --rm \
		--name r-base-shell \
		bitnoize/r-base:latest \
		/bin/bash

