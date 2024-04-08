#!/bin/bash
set -x
rm -f /tmp/file
for i in $(seq 1 50000); do echo $i >> /tmp/file; done
