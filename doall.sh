#!/bin/bash

cd "`dirname $0`"

./run-skydock.sh
./buildimages.sh

docker-compose build
docker-compose up
