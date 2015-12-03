#!/bin/bash

/usr/sbin/runsvdir-start & 

sleep 1

# run any initialisation stuff now that the services are started
if [ -n "$*" ]
then
	echo Runnning '$*' for setup
	$*
fi


tail -n100 -F /log/*/current
