#!/bin/bash
set -e

cleanup() {
    echo "Cleaning up..."
    exit
}

trap cleanup INT TERM
DATA_PATH=${DATA_PATH:-/tmp/file}

while :; do
    echo "Hello! ${SECONDS} secs elapsed..."
    cat $DATA_PATH
    sleep 5s
done
