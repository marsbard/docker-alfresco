#!/bin/bash

set -ex

# has to happen after the data store is mounted
if [ ! -f  /data/workspace-SpacesStore/conf/solrconfig.xml ]
then
  cd /data
  unzip /tmp/alfresco-solr4-config-ssl.zip 
	cp -rv /config/* /data
fi

cp /config/log4j-solr.properties /data

/tomcat/bin/catalina.sh run
