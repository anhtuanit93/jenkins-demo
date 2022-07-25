#!/bin/bash

echo "********************"
echo "** Pushing image ***"
echo "********************"

IMAGE="maven-project"

echo "** Logging in ***"
docker login -u anhtuanit93 -p $PASS
echo "*** Tagging image ***"
docker tag $IMAGE:$BUILD_TAG anhtuanit93/$IMAGE:$BUILD_TAG
echo "*** Pushing image ***"
docker push anhtuanit93/$IMAGE:$BUILD_TAG
