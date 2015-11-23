#!/bin/bash

# expecting "<hostname>=<ip>"

INPUT=`cat`

HOST=`echo $INPUT | cut -f1 -d=`
IP=`echo $INPUT | cut -f2 -d=`

echo +${HOST}:${IP}:a > /data/data.d/${HOST}

cat /data/data.d/* > /data/data
cd /data
tinydns-data
