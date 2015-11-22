#!/bin/bash


while ! nc localhost 8500
do
	 sleep 1
done

/bin/registrator consul://localhost:8500
