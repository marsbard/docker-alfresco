#!/bin/bash

PORT=8500

function decho {
	echo $(date +"%Y-%m-%d %H:%M:%S") $*

}

decho DNS bootstrapper
NET=$( route -n | grep UG | xargs | cut -f2 -d' ' | cut -f1-3 -d. )


decho Short delay just to make sure Consul is up first
sleep 3

for n in `seq 2 254`
do
	(
		nc -z -w 1 ${NET}.${n} 53
		if [ $? = 0 ]
		then
			decho Bootstrapping consul at ${NET}.${n}
			echo ${NET}.${n} > /CONSUL_HOST
		fi
	) &
done

WAIT=10
WAITED=0

while [ $WAITED -lt $WAIT ]
do
	WAITED=$(( $WAITED + 1 ))
	if [ -f /CONSUL_HOST ]
	then
		WAITED=$WAIT
	fi
	sleep 1
done


export CONSUL_HOST=$(cat /CONSUL_HOST)
if [ -n $CONSUL_HOST ]
then
	# get device which has the gateway
	DEFAULT_DEV=$(route -n | grep UG | xargs | cut -f8 -d' ')
	# and use that to get my IP
	MY_IP=$( ip addr | grep ${DEFAULT_DEV}  | grep inet | xargs | cut -f2 -d' ' | cut -f1 -d/ )
	decho "Registering my IP ${MY_IP} and hostname ${hostname} with http://${CONSUL_HOST}:8053/?host=$(hostname)&ip=${MY_IP}"
	curl -L "http://${CONSUL_HOST}:${PORT}/?host=$(hostname)&ip=${MY_IP}"
fi 

decho Set up resolv.conf
echo -e "nameserver ${CONSUL_HOST}\nnameserver 8.8.8.8" > /etc/resolv.conf

# Continue with whatever else was scheduled
$*
