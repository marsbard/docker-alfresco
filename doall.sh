#!/bin/bash

cd "`dirname $0`"

./buildimages.sh

docker-compose build
docker-compose up
