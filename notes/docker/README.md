# Docker

## Commands

### Images

#### Build an image

    docker build [--tag <tag>] <path to directory containing a Dockerfile>

#### List images

    docker image ls [-a]

#### Remove unused images

    docker image prune

### Containers

#### List containers

    docker container ls [-a]

#### Start a container

    docker run [-it] [-p <local port>:<container port>] [<host>:<port>/]<name>[:<tag>]

- Images are pulled from Docker Hub (https://hub.docker.com/) by default

#### Connect to a running container

    docker exec [-it] <container name> /bin/bash

#### Remove stopped containers

    docker container prune
