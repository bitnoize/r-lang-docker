
IMAGENAME="bitnoize/r-base"

.PHONY: help build push shell

.DEFAULT_GOAL := help

help:
	@echo "Makefile commands: build push shell"

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

shell:
	docker run -it --rm \
		--name r-base-shell \
		bitnoize/r-base:latest \
		/bin/bash

