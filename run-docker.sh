#!/bin/bash -e

# BASIC DOCKER COMMAND
# docker login to a registry
# docker login
# docker login registry.gitlab.com

# docker build
# docker build -t richasdy/springboot-devops .
# docker build -t registry.gitlab.com/richasdy/springboot-devops .

# docker tag
# docker tag 62b8035ef268 richasdy/springboot-devops:latest
# docker tag 62b8035ef268 registry.gitlab.com/richasdy/springboot-devops:latest

# docker push
# docker push richasdy/springboot-devops
# docker push registry.gitlab.com/richasdy/springboot-devops

# run docker
# docker run -d -p 8080:8080 --name springboot-devops -t richasdy/springboot-devops 
# docker run -d -p 8080:8080 --name springboot-devops -t registry.gitlab.com/richasdy/springboot-devops

# DOCKER INTEGRATION WITH MAVEN
# Build a Docker Image 
# -DpushImage for push image to dockerhub 
# mvn package docker:build -DpushImage
mvn package docker:build

# preparation, remove if docker container exist
# error for the first time, container not exist but remove, USE : conditional
# docker stop springboot-devops
# docker rm springboot-devops

# run docker
docker run -d -p 8080:8080 --name springboot-devops -t richasdy/springboot-devops 
	
# Using Spring Profiles
# docker run -e "SPRING_PROFILES_ACTIVE=prod" -p 8080:8080 -t springio/gs-spring-boot-docker

# Debugging the application in a Docker container
# docker run -e "JAVA_OPTS=-agentlib:jdwp=transport=dt_socket,address=5005,server=y,suspend=n" -p 8080:8080 -p 5005:5005 -t richasdy/springboot-devops