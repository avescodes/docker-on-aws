#!/usr/bin/env bash

echo "Launching Redis..."
docker run --detach \
           --publish 6379:6379 \
           --name redis \
           redis

echo
echo "Launching Sample Service..."
echo "Press <ctrl-c> to exit."
docker run --tty \
           --interactive \
           --rm \
           --link redis:redis \
           --publish 8080:8080 \
           --name "sample-service" \
           rkneufeld/sample-service:simple

echo
echo "Stopping Redis container"
docker stop redis > /dev/null
docker rm redis > /dev/null
