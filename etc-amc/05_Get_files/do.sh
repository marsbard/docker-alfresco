#!/bin/bash

echo Getting alfresco dependencies

for dir in alfresco share solr
do
	echo Running $dir/get
  $dir/get.sh
done
