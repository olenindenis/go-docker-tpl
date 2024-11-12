docker_bin := $(shell command -v docker 2> /dev/null)
docker_compose_bin := $(shell command -v docker-compose 2> /dev/null)

run_prod:
	DOCKER_BUILDKIT=0 $(docker_compose_bin) -f docker-compose.yml up -d

build_prod:
	DOCKER_BUILDKIT=0 $(docker_compose_bin) -f docker-compose.yml up --build --remove-orphans --force-recreate

run_dev:
	DOCKER_BUILDKIT=0 $(docker_compose_bin) -f docker-compose.yml -f docker-compose.override.yml up

build_dev:
	$(docker_bin) volume prune --force
	DOCKER_BUILDKIT=0 $(docker_compose_bin) -f docker-compose.yml -f docker-compose.override.yml up --build --remove-orphans --force-recreate

down: ## Stop all started for development containers
	$(docker_compose_bin) down