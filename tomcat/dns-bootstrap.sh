#!/bin/bash

function decho {
	echo $(date +"%Y-%m-%d %H:%M:%S") $*

}

decho DNS bootstrapper
NET=$( route -n | grep UG | xargs | cut -f2 -d' ' | cut -f1-3 -d. )


decho Short delay just to make sure DNS is up first
sleep 5

for n in `seq 2 254`
do
	(
		nc -z -w 1 ${NET}.${n} 53
		if [ $? = 0 ]
		then
			decho Bootstrapping DNS at ${NET}.${n}
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
		WAITED=$WAIT
	fi
	sleep 1
done


export DNS_HOST=$(cat /DNS_HOST)
if [ -n $DNS_HOST ]
then
	# get device which has the gateway
	DEFAULT_DEV=$(route -n | grep UG | xargs | cut -f8 -d' ')
	# and use that to get my IP
	MY_IP=$( ip addr | grep ${DEFAULT_DEV}  | grep inet | xargs | cut -f2 -d' ' | cut -f1 -d/ )
	decho "Registering my IP ${MY_IP} and hostname ${hostname} with http://${DNS_HOST}:8053/?host=$(hostname)&ip=${MY_IP}"
	curl -L "http://${DNS_HOST}:8053/?host=$(hostname)&ip=${MY_IP}"
fi 

decho Set up resolv.conf
echo -e "nameserver ${DNS_HOST}\nnameserver 8.8.8.8" > /etc/resolv.conf

# Continue with whatever else was scheduled
$*
