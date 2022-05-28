
IMAGENAME="bitnoize/r-base"

.PHONY: help build push test all

help:
	@echo "Makefile commands: build push test"

.DEFAULT_GOAL := all

build: .build-cran40-debian

push: .push-cran40-debian

.build-cran40-debian:
	docker build --pull --no-cache \
		-t "$(IMAGENAME):4.2-bullseye" \
		-t "$(IMAGENAME):latest" \
		-f Dockerfile.debian \
		.

.push-cran40-debian:
	docker push "$(IMAGENAME):4.2-bullseye"
	docker push "$(IMAGENAME):latest"

test:
	docker run -it --rm \
		--name test-r-shell \
		bitnoize/r-base:latest

all: build push

