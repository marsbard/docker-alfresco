#!/bin/bash

# expecting "<hostname>=<ip>"

INPUT=`cat`

HOST=`echo $INPUT | cut -f1 -d=`
IP=`echo $INPUT | cut -f2 -d=`

echo HOST=$HOST
echo IP=$IP

echo +${HOST}:${IP}:a > /data/data.d/${HOST}

# huh. should always be true as we just wrote something.... so why was I
# getting 'file not found' errors?
if [ $(ls /data/data.d/* | wc -l ) -gt 0 ]
then
	cat /data/data.d/* > /data/tinydns-data
	/rebuild-tinydns-data.sh
fi
