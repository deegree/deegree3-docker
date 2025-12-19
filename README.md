[![Docker Image CI](https://github.com/deegree/deegree3-docker/actions/workflows/docker-image.yaml/badge.svg)](https://github.com/deegree/deegree3-docker/actions/workflows/docker-image.yaml)

# Supported tags and respective `Dockerfile` links

- deegree 3.6 (JDK 17/Tomcat 10.1): `3.6.5`, `3.6`, `latest` (deprecated tags: `3.6.4`, `3.6.3`, `3.6.2`, `3.6.1`, `3.6.0`) - [Dockerfile](https://github.com/deegree/deegree3-docker/blob/main/3.6/Dockerfile)
- deegree 3.5 (JDK 11/Tomcat 9): `3.5.17`, `3.5` (deprecated tags: `3.5.16`, `3.5.15`, `3.5.14`, `3.5.13`, `3.5.12`, `3.5.11`, `3.5.10`, `3.5.8`, `3.5.7`, `3.5.6`, `3.5.5`, `3.5.4`, `3.5.3`, `3.5.2`, `3.5.1`, `3.5.0`) - [Dockerfile](https://github.com/deegree/deegree3-docker/blob/main/3.5/Dockerfile)
- deegree 3.4 (JDK 8/Tomcat 8.5): `v3.4.35`, `v3.4`, `3.4` (deprecated tags: `v3.4.34`, `v3.4.33`, `v3.4.32`, `v3.4.31`, `v3.4.29`, `v3.4.28`, `v3.4.26`, `v3.4.25`, `v3.4.24`, `v3.4.23`, `v3.4.22`, `v3.4.20`, `v3.4.19`, `v3.4.18`, `v3.4.17`, `v3.4.16`, `v3.4.15`, `v3.4.14`, `v3.4.13`, `v3.4.12`, `v3.4.10`, `v3.4.9`, `v3.4.8`, `v3.4.7`, `v3.4.6`, `v3.4.5`, `v3.4.4`, `v3.4.3`, `v3.4.2`, `v3.4.1`, `v3.4.0`) - [Dockerfile](https://github.com/deegree/deegree3-docker/blob/main/3.4/Dockerfile)

# Quick reference

## deegree web services on Docker
Official Dockerfile for [deegree web services](https://www.deegree.org/). This repository contains a ```Dockerfile``` for building Docker images containing ready-to-use deegree webservices.
 
Please consult the [deegree documentation](https://download.deegree.org/documentation/current/html/) for further information how to 
configure and use deegree webservices. The [Docker web site](https://www.docker.com/) provides all information 
about Docker.

## Docker images on Docker hub

[![deegree3-docker](https://dockeri.co/image/deegree/deegree3-docker)](https://hub.docker.com/r/deegree/deegree3-docker/)

https://hub.docker.com/r/deegree/deegree3-docker/

## How to use it

Use the following command to pull the latest image:

```
docker pull deegree/deegree3-docker:latest
```

To start a docker container with the name `deegree` on port 8080 run the following command:

```
docker run -d --name deegree -p 8080:8080 deegree/deegree3-docker:latest
```
Running the image with `-d` runs the container in detached mode, leaving the container running in the background.
The `--name` flag is setting the name for the container. The `-p` flag redirects a public port to a private port inside the container.

### How to access deegree administration console

To access the deegree webservices console start a browser of your choice and open the URL:

http://<container_ip>:8080/deegree-webservices/, the `<container_ip>` depends on the docker networking mode.
http://localhost:8080/deegree-webservices/ should work with bridge mode.

Continue with configuration of deegree as described in the [getting started guide](https://download.deegree.org/documentation/current/html/#anchor-lightly) of the deegree webservices handbook.

### How to access deegree command-line interface (CLI)

After you have started the container you can run the deegree CLI tools with:

```
docker exec -w /opt deegree java -jar deegree-tools-gml.jar -help
```

Now you can use the deegree CLI to generate configuration files based on an GML application schema using the following command:

```
docker exec -w /opt/ deegree java -jar deegree-tools-gml.jar SqlFeatureStoreConfigCreator -format=all -dialect=postgis -cycledepth=1 -schemaUrl=https://inspire.ec.europa.eu/schemas/ps/4.0/ProtectedSites.xsd
```

Read further in the [deegree webservices handbook](https://download.deegree.org/documentation/current/html/#deegree-gml-tools) how to use the deegree command-line interface.
