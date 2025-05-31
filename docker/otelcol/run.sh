#!/bin/bash

WDIR=$(dirname $(readlink -f ${BASH_SOURCE[0]}))
source $WDIR/../include.sh
source $WDIR/include.sh

docker network create $NETWORK_NAME

docker run --rm -d \
    --name $CONTAINER_NAME \
    -v ${WDIR}/config.yaml:/etc/otelcol/config.yaml \
    -p 4317:4317 \
    -p 4318:4318 \
    -p 55679:55679 \
    --network $NETWORK_NAME \
    $IMAGE_NAME \
    --feature-gates=otelcol.printInitialConfig \
    --config=/etc/otelcol/config.yaml \
    # print-initial-config
    

docker logs -f $CONTAINER_NAME
