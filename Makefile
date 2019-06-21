.PHONY: all
all: help

.PHONY: help
help:
	# -----------------------------------------------------------
	# Make targets:
	#
	# 	help : (renders this help text)
	#	stop : stop the containers
	#	start: start the containers
	#
	# end.
	# -----------------------------------------------------------

.PHONY: start
start: stop
	# added `grafana:user: ${GRAFANA_USER_ID}` to docker-compose.yml in
	# order to have write access to the current directory from docker
	export GRAFANA_USER_ID=$(shell id -u) && \
	    export CURRENT_DIRECTORY=$(CURDIR) && \
	    docker-compose up -d
	docker ps
	sensible-browser http://localhost:3000



.PHONY: stop
stop:
	export GRAFANA_USER_ID=$(shell id -u) && docker-compose down
	docker ps
