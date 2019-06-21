.PHONY: all
all: start

.PHONY: start
start: stop
	# added `grafana:user: ${GRAFANA_USER_ID}` to docker-compose.yml in
	# order to have write access to the current directory from docker
	export GRAFANA_USER_ID=$(shell id -u) && docker-compose up -d


.PHONY: stop
stop:
	docker-compose down
