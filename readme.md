# Monitor

Provides easy-to-use monitoring for systems and applications using docker-compose.

## Dependencies

* docker
* docker-compose
* make

## Useage

```bash
$ make help

# -----------------------------------------------------------
# Make targets:
#
# 	help : (renders this help text)
#	stop : stop the containers
#	start: start the containers
#
# end.
# -----------------------------------------------------------
```

```bash
$ make start

export GRAFANA_USER_ID=1000 && docker-compose down
WARNING: The CURRENT_DIRECTORY variable is not set. Defaulting to a blank string.
Stopping monitor_collectd_1      ... done
Stopping monitor_influxdb_1      ... done
Stopping monitor_node-exporter_1 ... done
Stopping monitor_grafana_1       ... done
Stopping monitor_prometheus_1    ... done
Removing monitor_collectd_1      ... done
Removing monitor_influxdb_1      ... done
Removing monitor_node-exporter_1 ... done
Removing monitor_grafana_1       ... done
Removing monitor_prometheus_1    ... done
Removing network monitor_default
docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
# added `grafana:user: ` to docker-compose.yml in
# order to have write access to the current directory from docker
export GRAFANA_USER_ID=1000 && \
    export CURRENT_DIRECTORY=/home/toddg/repos/personal/monitor && \
    docker-compose up -d
Creating network "monitor_default" with the default driver
Creating monitor_prometheus_1 ...
Creating monitor_grafana_1 ...
Creating monitor_influxdb_1 ...
Creating monitor_node-exporter_1 ...
Creating monitor_collectd_1 ...
Creating monitor_grafana_1
Creating monitor_prometheus_1
Creating monitor_influxdb_1
Creating monitor_node-exporter_1
Creating monitor_prometheus_1 ... done
docker ps
CONTAINER ID        IMAGE                        COMMAND                  CREATED             STATUS                  PORTS                                                                      NAMES
df36b607a2f3        fr3nd/collectd:5.5.0-1       "/entrypoint.sh"         5 seconds ago       Up 4 seconds                                                                                       monitor_collectd_1
e685476f2fab        prom/node-exporter:v0.18.1   "/bin/node_exporter …"   5 seconds ago       Up 1 second             0.0.0.0:9100->9100/tcp                                                     monitor_node-exporter_1
a6ca2b3df25b        influxdb:1.5.4               "/entrypoint.sh infl…"   5 seconds ago       Up 3 seconds            0.0.0.0:8083->8083/tcp, 0.0.0.0:8086->8086/tcp, 0.0.0.0:25826->25826/udp   monitor_influxdb_1
b62a8fbf9c72        prom/prometheus:v2.10.0      "/bin/prometheus --c…"   5 seconds ago       Up Less than a second   0.0.0.0:9090->9090/tcp                                                     monitor_prometheus_1
dc3e68ecaf59        grafana/grafana:6.2.4        "/run.sh"                6 seconds ago       Up 2 seconds            0.0.0.0:3000->3000/tcp                                                     monitor_grafana_1
sensible-browser http://localhost:3000

```

```bash
$ make stop

export GRAFANA_USER_ID=1000 && docker-compose down
WARNING: The CURRENT_DIRECTORY variable is not set. Defaulting to a blank string.
Stopping monitor_collectd_1      ... done
Stopping monitor_node-exporter_1 ... done
Stopping monitor_influxdb_1      ... done
Stopping monitor_prometheus_1    ... done
Stopping monitor_grafana_1       ... done
Removing monitor_collectd_1      ... done
Removing monitor_node-exporter_1 ... done
Removing monitor_influxdb_1      ... done
Removing monitor_prometheus_1    ... done
Removing monitor_grafana_1       ... done
Removing network monitor_default
docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
```

## Technology

* Collectors:   collectd, prometheus
* Store:        influxdb
* Viewer:       grafana

## URLS

* prometheus    : http://localhost:9090/targets
* node-exporter : http://localhost:9100/metrics
* grafana       : http://localhost:3000

## Attribution

* Xiao Han
  * https://blog.laputa.io/@justlaputa
  * https://blog.laputa.io/try-influxdb-and-grafana-by-docker-6b4d50c6a446
* Tristan Sloughter 
  * https://spacetimeinsight.com/author/tristan/
  * https://spacetimeinsight.com/installing-monitoring-erlang-releases-kubernetes-helm-prometheus/
* Ilya Khaprov
  * https://github.com/deadtrickster
  * https://github.com/deadtrickster/beam-dashboards.git


## Links

A collection of links that where useful for this project:

* https://docs.docker.com/storage/volumes/
* https://docs.docker.com/compose/compose-file/
* https://stackoverflow.com/questions/56009180/how-to-see-error-logs-when-docker-compose-fails
* https://grafana.com/dashboards/24
* https://www.rebar3.org/docs/plugins
* https://linoxide.com/containers/setup-monitoring-docker-containers-prometheus/
