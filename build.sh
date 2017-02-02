#!/bin/sh

CONTAINER_IMAGE=${CONTAINER_IMAGE:-nextthingco/chiptainer_example}

docker build -t "${CONTAINER_IMAGE}" .
