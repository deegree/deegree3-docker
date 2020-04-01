# Supported tags and respective `Dockerfile` links

- `v.3.4.12` (`latest`), `v.3.4.11`, `v.3.4.10`, `v.3.4.9`, `v.3.4.8`, `v.3.4.7`, `v.3.4.6`, `v.3.4.5`, `v.3.4.4`, `v.3.4.3`, `v.3.4.2`, `v.3.4.1`, `v.3.4.0` - [Dockerfile](https://github.com/deegree/deegree3-docker/blob/master/Dockerfile)

# Quick reference

## deegree web services on Docker
Official Dockerfile for deegree web services. This repository contains a ```Dockerfile``` for building Docker images containing ready-to-use deegree webservices.
 
Please consult the [deegree documentation](http://www.deegree.org/documentation) for further information how to 
configure and use deegree webservices. The [Docker web site](https://www.docker.com/) provides all information 
about Docker.

## Docker images on Docker hub

[![deegree-docker](http://dockeri.co/image/deegree/deegree3-docker)](https://hub.docker.com/r/deegree/deegree3-docker/)

https://hub.docker.com/r/deegree/deegree3-docker/

## How to use it

Use the following command to pull the latest image:

```
docker pull deegree/deegree3-docker:latest
```

All images are based on the official Apache Tomcat 8.5+ with OpenJDK 8 image.

To start a docker container with the name `deegree` on port 8080 run the following command:

```
docker run --name deegree -p 8080:8080 deegree/deegree3-docker
```
