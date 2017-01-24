#!/bin/bash -e

# packaging and run --> basic maven
# mvn package && java -jar target/springboot-devops-0.0.1-SNAPSHOT.jar

# docker
# package for docker
# -DpushImage for push image to dockerhub
# mvn package docker:build -DpushImage
mvn package docker:build

# run docker
docker run -d -p 8080:8080 --name springboot-devops -t richasdy/springboot-devops 