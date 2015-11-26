#!/bin/bash

cd "`dirname $0`"

if [ "$1" = "stop" ]
then
	docker stop skydock
	docker stop skydns

	exit
fi

if docker ps -a | grep skydns 2>&1 > /dev/null
then
	if ! docker ps | grep skydns 2>&1 > /dev/null
	then
		docker rm skydock
		docker rm skydns
  fi
fi

if ! docker ps | grep skydns 2>&1 > /dev/null
then
	BRIDGE_IP=$( ip addr | grep -A2 docker0: | grep inet | xargs | cut -f2 -d' ' | cut -f1 -d/ )

	docker run -d -p $BRIDGE_IP:53:53/udp --name skydns crosbymichael/skydns -nameserver 8.8.8.8:53 -domain docker

	docker run -d -v /var/run/docker.sock:/docker.sock --name skydock crosbymichael/skydock \
		-ttl 30 -environment ns -s /docker.sock -domain docker -name skydns
fi


