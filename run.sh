#!/bin/bash -e

# packaging and run --> basic maven
#mvn package && java -jar target/springboot-devops-0.0.1-SNAPSHOT.jar

# docker
# package for docker
# -DpushImage for push image to dockerhub
#mvn package docker:build -DpushImage
mvn package docker:build

# preparation, remove if docker container exist
# error for the first time, container not exist
docker stop springboot-devops
docker rm springboot-devops

# run docker
docker run -d -p 8080:8080 --name springboot-devops -t richasdy/springboot-devops 

# run docker with option
#docker run -e "SPRING_PROFILES_ACTIVE=prod" -p 8080:8080 -t springio/gs-spring-boot-docker