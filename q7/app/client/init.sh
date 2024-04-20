#!/bin/bash

cleanup() {
    echo "Cleaning up..."
    exit
}

trap cleanup INT TERM

HOST=${HOST:-localhost}
PORT=${PORT:-9090}

send_request() {
    curl --max-time 2 -s -o /dev/null -w "%{http_code}" http://$HOST:$PORT
}

while :; do
    response_code=$(send_request)
    echo "HTTP request sent to $HOST:$PORT, Response code: $response_code"
    sleep 0.001
done
