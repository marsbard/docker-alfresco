#!/bin/bash

cd "`dirname $0`"

if docker ps | grep skydock
then

	docker stop skydock
	docker rm skydock

	docker stop skydns
	docker rm skydns

fi


BRIDGE_IP=$( ip addr | grep -A2 docker0: | grep inet | xargs | cut -f2 -d' ' | cut -f1 -d/ )

docker run -d -p $BRIDGE_IP:53:53/udp --name skydns crosbymichael/skydns -nameserver 8.8.8.8:53 -domain docker

docker run -d -v /var/run/docker.sock:/docker.sock --name skydock crosbymichael/skydock \
	-ttl 30 -environment ns -s /docker.sock -domain docker -name skydns
 


#cat docker-compose.yml.tmpl | sed "s/<%SKYDNS%>/$BRIDGE_IP/" > docker-compose.yml
