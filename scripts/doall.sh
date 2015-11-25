#!/bin/bash

cd "`dirname $0`"

./get.sh
./run-skydock.sh
./buildimages.sh

docker-compose build
docker-compose up
