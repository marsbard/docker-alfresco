#!/bin/bash

cd "`dirname $0`"

docker build -f Dockerfile.dev -t marsbard/tomcat tomcat
docker build -t marsbard/registrator:latest registrator
