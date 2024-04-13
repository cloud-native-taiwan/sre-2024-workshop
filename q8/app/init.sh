#!/bin/bash
set -xe

cleanup() {
    echo "Cleaning up..."
    exit
}

trap cleanup INT TERM
DATA_PATH=${DATA_PATH:-/tmp/file}

while :; do
    echo "Hello! ${SECONDS} secs elapsed..." >> $DATA_PATH
    sleep 1s
done
