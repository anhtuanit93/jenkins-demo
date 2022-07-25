#!/bin/bash

# Copy the new jar to the build location
cp -f pipeline6/java-app/target/*.jar pipeline6/jenkins/build/

echo "****************************"
echo "** Building Docker Image ***"
echo "****************************"

cd pipeline6/jenkins/build/ && docker-compose -f docker-compose-build.yml build #--no-cache
