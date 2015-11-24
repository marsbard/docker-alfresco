#!/bin/bash

# set up the environment
mkdir -p /data/data.d

cp /tmp/{tinydns.data,axfrdns.tcp} /data

# run the passed in arguments in the background
$* &


# get the data files out of /tmp and into the real mount for /init.sh
#mv /tmp/{tinydns.data,axfrdns.tcp} /data
#mkdir /data/data.d

# and now run the real service
# from https://hub.docker.com/r/skurtzemann/tinydns/~/dockerfile/
/init.sh
