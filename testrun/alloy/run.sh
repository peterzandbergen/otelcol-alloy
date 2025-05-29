#!/bin/bash

WDIR=$(dirname $(readlink -f ${BASH_SOURCE[0]}))
source $WDIR/../include.sh
source $WDIR/include.sh

docker network create $NETWORK_NAME

docker run --rm -d \
    --name $CONTAINER_NAME \
    -v ${WDIR}/config.alloy:/etc/alloy/config.alloy \
    -p 12345:12345 \
    -p 14317:4317 \
    -p 14318:4318 \
    --network $NETWORK_NAME \
    $IMAGE_NAME \
    run --server.http.listen-addr=0.0.0.0:12345 \
        --storage.path=/var/lib/alloy/data \
        --stability.level=experimental \
    /etc/alloy/config.alloy

docker logs -f $CONTAINER_NAME
