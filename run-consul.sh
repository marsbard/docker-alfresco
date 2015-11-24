#!/bin/sh

set -ex

docker rm -f consul registrator || true

docker run \
	-d \
	--hostname consul \
	--name consul \
	-p 8500:8500 \
	gliderlabs/consul-server -bootstrap

#docker build -t marsbard/registrator consul/registrator
#
#docker run \
#	-d \
#	--net host \
#	--name registrator \
#	-v /var/run/docker.sock:/tmp/docker.sock \
#  marsbard/registrator consul://consul:8500
#	#--hostname registrator \


export CONSUL_HOST=`docker inspect --format '{{ .NetworkSettings.IPAddress }}' consul`

