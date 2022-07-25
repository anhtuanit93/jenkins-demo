#!/bin/bash

echo maven-project > /tmp/.auth
echo $BUILD_TAG >> /tmp/.auth
echo $PASS >> /tmp/.auth

scp  /tmp/.auth root@192.168.150.128:/tmp/.auth
scp ./pipeline6/jenkins/deploy/publish root@113.164.246.20:/tmp/publish
ssh root@192.168.150.128 "/tmp/publish"
