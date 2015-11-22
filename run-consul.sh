#!/bin/sh

docker run -t alfresco_consul \
	-d \
	--hostname consul \
	--name consul \
	-p 8500:8500 \
	gliderlabs/consul-server -bootstrap

docker build -t marsbard/registrator consul/registrator

docker run -t alfresco_registrator \
	-d \
	--hostname registrator \
	--name registrator \
	-v /var/run/docker.sock:/tmp/docker.sock
  marsbard/registrator consul://consul:8500

