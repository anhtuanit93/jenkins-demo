#!/bin/bash

echo maven-project > /tmp/.auth
echo $BUILD_TAG >> /tmp/.auth
echo $PASS >> /tmp/.auth

scp  /tmp/.auth root@192.168.150.128:/tmp/.auth
scp ./jenkins/deploy/publish root@192.168.150.128:/tmp/publish
ssh root@192.168.150.128 "/bin/bash /tmp/publish"
