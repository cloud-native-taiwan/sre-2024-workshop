#!/bin/bash
set -xe

cleanup() {
    echo "Cleaning up..."
    exit
}

trap cleanup INT TERM
DATA_PATH=${DATA_PATH:/tmp/}

dd if=/dev/zero of=$DATA_PATH/file bs=1M count=2048

while :; do
    echo "Hello! ${SECONDS} secs elapsed..."
    sleep 1s
done
