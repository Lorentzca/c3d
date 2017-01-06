# Create Consul Cluster on Docker

[consul](https://www.consul.io) on [docker](https://www.docker.com/)

## Start

build

```
docker-compose build
```

up

```
docker-compose up
```

## Login to container

ex) login to server2

```
docker exec -it $(docker ps -q -f name=server2) sh
```

## Check members

ex) show members of server1 cluster

```
docker exec -it $(docker ps -q -f name=server1) consul members
```

## Join cluster

ex) add server3 to server1 cluster

```
docker exec -it $(docker ps -q -f name=server3) consul join c3d_server1.docker
```

## Exec command to All members

ex) exec command via server2

```
docker exec -it $(docker ps -q -f name=server2) consul exec uname -a
```

## Scale cluster

ex) scale server3

```
docker-compose scale server3=4
```

## Consul Web UI

<http://localhost:8500/ui/consul_web_ui/>

![consul_web_ui](./images/consul_web_ui.gif)

## TODO

- [x] Add Consul Web UI
- [ ] Add Service
