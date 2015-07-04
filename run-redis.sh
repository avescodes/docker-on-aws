#!/usr/bin/env bash

echo "Launching Redis..."
docker run --detach \
           --publish 6379:6379 \
           --name redis \
           redis
