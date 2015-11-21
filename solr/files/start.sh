#!/bin/bash

# has to happen after the data store is mounted
if [ ! -f  /data/workspace-SpacesStore/conf/solrconfig.xml ]
then
	cp -rv /config/* /data
  cd /data
  unzip /tmp/alfresco-solr4-config-ssl.zip 
fi

/tomcat/bin/catalina.sh run
