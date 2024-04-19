#!/bin/bash

cleanup() {
    echo "Cleaning up..."
    exit
}

trap cleanup INT TERM

sleep 60s
stress-ng -m 10 --vm-bytes 256M --vm-keep -t 10

while :; do
    echo "Hello! ${SECONDS} secs elapsed..."
    sleep 1s
done
