#!/bin/bash

cd "`dirname $0`"

docker build -t marsbard/tomcat ./tomcat
#docker build -t marsbard/registrator:latest ./consul/registrator
