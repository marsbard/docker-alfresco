#!/bin/bash

mkdir -p /data/data.d

while true
do
	nc -lp 8053 -e /listener.sh 
done
