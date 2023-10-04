#!/bin/bash
if [ $(buildkite-agent meta-data get approval) == "yes" ]; then
         docker login -u dineshcode97 -p $DPASS
         docker push $DOCKER_REGISTRY/$DOCKER_IMAGE_NAME:$DOCKER_IMAGE_TAG
fi
