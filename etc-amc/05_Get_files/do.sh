#!/bin/bash

for filename in */get.sh
do
	echo Running $filename
  $filename 
done
