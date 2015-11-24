#!/bin/bash

NET=$( route -n | grep UG | xargs | cut -f2 -d' ' | cut -f1-3 -d. )

sleep 2

for n in `seq 2 254`
do
	(
		nc -z -w 1 ${NET}.${n} 8053
		if [ $? = 0 ]
		then
			echo ${NET}.${n} > /DNS_HOST
		fi
	) &
done

WAIT=10
WAITED=0

while [ $WAITED -lt $WAIT ]
do
	WAITED=$(( $WAITED + 1 ))
	if [ -f /DNS_HOST ]
	then
		export DNS_HOST=$(cat /DNS_HOST)
		WAITED=$WAIT
	fi
	sleep 1
done

if [ -n $DNS_HOST ]
then
	# get device which has the gateway
	DEFAULT_DEV=$(route -n | grep UG | xargs | cut -f8 -d' ')
	# and use that to get my IP
	MY_IP=$( ip addr | grep ${DEFAULT_DEV}  | grep inet | xargs | cut -f2 -d' ' | cut -f1 -d/ )

	curl -L http://${DNS_HOST}:8053/?host=$(hostname)&ip=${MY_IP}
fi 

echo -e "nameserver ${DNS_HOST}\nnameserver 8.8.8.8" > /etc/resolv.conf

# Continue with whatever else was scheduled
$*
