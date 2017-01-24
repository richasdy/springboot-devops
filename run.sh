#!/bin/bash -e
#package and run
mvn package && java -jar target/springboot-devops-0.0.1-SNAPSHOT.jar
