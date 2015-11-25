#!/bin/bash


cd "`dirname $0`"

for file in */get.sh
do
	$file
done
