#!/bin/bash

WDIR=$(dirname $(readlink -f ${BASH_SOURCE[0]}))
source $WDIR/../include.sh
source $WDIR/include.sh

docker stop $CONTAINER_NAME
