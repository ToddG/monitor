.PHONY: all
all: start

.PHONY: start
start: stop
	# added `grafana:user: ${USER_ID}` to docker-compose.yml in
	# order to have write access to the current directory from docker
	export USER_ID=$(shell id -u) && docker-compose up -d
	docker ps
	sensible-browser http://localhost:3000


.PHONY: stop
stop:
	export USER_ID=$(shell id -u) && docker-compose down --remove-orphans

.PHONY: go
go:
	sensible-browser http://localhost:3000
