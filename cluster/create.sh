#!/bin/bash

WDIR=$(dirname $(readlink -f ${BASH_SOURCE[0]}))

echo $WDIR

kind create cluster --config=$WDIR/kind-config.yaml