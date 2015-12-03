#!/bin/bash

MYIP=$( ifconfig eth0 | grep inet\  | cut -f2 -d: | cut -f1 -d' ' )
HOST=`cat /etc/hostname | cut -f1 -d.`
curl -XPUT http://${ETCD_HOST}:4001/v2/keys/skydns/docker/ns/${HOST} \
	-d value='{"Host": "'${MYIP}'"}'

echo "nameserver $ETCD_HOST" > /etc/resolv.conf
