#!/bin/bash

while true
do
	nc -lp 8053 -e /listener.sh 
done
