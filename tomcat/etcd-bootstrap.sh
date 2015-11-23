#!/bin/bash

NET=$( route -n | grep UG | xargs | cut -f2 -d' ' | cut -f1-3 -d. )

for n in `seq 2 254`
do
	(
		nc -z -w 1 ${NET}.${n} 2379
		if [ $? = 0 ]
		then
			echo ${NET}.${n} > /ETCD_HOST
		fi
	) &
done

WAIT=10
WAITED=0

while [ $WAITED -lt $WAIT ]
do
	WAITED=$(( $WAITED + 1 ))
	if [ -f /ETCD_HOST ]
	then
		export ETCD_HOST=$(cat /ETCD_HOST)
		WAITED=$WAIT
	fi
	sleep 1
done

if [ -n $ETCD_HOST ]
then
	# get device which has the gateway
	DEFAULT_DEV=$(route -n | grep UG | xargs | cut -f8 -d' ')
	# and use that to get my IP
	MY_IP=$( ip addr | grep ${DEFAULT_DEV}  | grep inet | xargs | cut -f2 -d' ' | cut -f1 -d/ )

	curl -L http://${ETCD_HOST}:2379/v2/keys/ip_$(hostname) -XPUT -d value=$MY_IP
fi 

# Continue with whatever else was scheduled
$*
