.DEFAULT_GOAL := help

DOCKER_IMAGE?=local_ftp_server:latest

FTP_USER?=admin
FTP_PSSWD?=admin
FTP_FOLDER?=$(PWD)/tmp/

.SHELL=bash

.PHONY: help
help:  ## Show this help.
	@grep -E '^\S+:.*?## .*$$' $(firstword $(MAKEFILE_LIST)) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "%-30s %s\n", $$1, $$2}'

PHONY: build
build:  ## Build local image
	@docker-compose build ftp

.PHONY: run
run:  ## run ftp server in ftp://localhost:2121/, serving by default: FTP_FOLDER=$pwd/tmp with user: admin, password: admin
	@docker-compose up -d --no-build

.PHONY: stop
stop:  ## stops ftp server
	@docker-compose down

.PHONY: get_host
get_host:
	@echo "`docker container inspect clarity-ftp -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}'`"