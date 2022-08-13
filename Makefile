SHELL = /bin/sh

.SUFFIXES:
.SUFFIXES: .sh

.PHONY: all
all: build run

.PHONY: clean
clean:
	docker compose down
	cd ./themes && rm -r PaperMod
	cd ./tests && rm -r bats test_helper

.PHONY: build
build: git-submodules
	docker compose build

.PHONY: run
run:
	docker compose up -d

.PHONY: install-bash
install-bash:
	sh ./scripts/install/bash.sh

.PHONY: install-npm
install-npm:
	sh ./scripts/install/npm.sh

.PHONY: install-netlify-cli
install-netlify-cli:
	sh ./scripts/install/netlify-cli.sh

.PHONY: install-hugo
install-hugo:
	sh ./scripts/install/hugo.sh

.PHONY: install-cli
install-git:
	sh ./scripts/install/git.sh $(env)

.PHONY: install-docker-cli
install-docker-cli:
	sh ./scripts/install/docker-cli.sh

.PHONY: verify-ci
verify-ci:
	sh ./scripts/ci/verify.sh $(env)

.PHONY: build-ci
build-ci:
	sh ./scripts/ci/build.sh

.PHONY: deploy-ci
deploy-ci:
	sh ./scripts/ci/deploy.sh $(id) $(token)

.PHONY: publish-ci
publish-ci: docker-login docker-build docker-push

.PHONY: git-submodules
git-submodules:
	sh ./scripts/shared/git-submodules.sh $(env)

.PHONY: docker-login
docker-login: 
	sh ./scripts/docker/login.sh $(username) $(token)

.PHONY: docker-build
docker-build:
	sh ./scripts/docker/build.sh $(tag)

.PHONY: docker-push
docker-push:
	sh ./scripts/docker/push.sh $(tag)
