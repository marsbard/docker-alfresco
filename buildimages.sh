#!/bin/bash

pushd tomcat
docker build -t marsbard/tomcat .
popd
pushd registrator
docker build -t marsbard/registrator .
popd
