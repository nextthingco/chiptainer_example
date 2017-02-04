#!/bin/sh

CONTAINER_IMAGE=${CONTAINER_IMAGE:-$(basename $PWD)}

docker build -t "${CONTAINER_IMAGE}" .
