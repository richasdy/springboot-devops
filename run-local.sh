#!/bin/bash -e

mvn package  && java -jar target/springboot-devops-0.0.1-SNAPSHOT.jar

# Packaging using the Maven plugin
# mvn package 

# Running as a packaged application
# java -jar target/springboot-devops-0.0.1-SNAPSHOT.jar

# Running using the Maven plugin
# mvn spring-boot:run