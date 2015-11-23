#!/bin/bash

cd "`dirname $0`"

docker build -f tomcat/Dockerfile.dev -t marsbard/tomcat ./tomcat
docker build -t marsbard/registrator:latest ./consul/registrator
