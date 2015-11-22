#!/bin/sh


echo -n "Waiting for consul "
while ! nc localhost 8500
do
	echo -n .
	 sleep 1
done

/bin/registrator consul://localhost:8500
