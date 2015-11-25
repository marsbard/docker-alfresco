#!/bin/bash

# has to happen after the data store is mounted
if [ ! -f  /data/workspace-SpacesStore/conf/solrconfig.xml ]
then
  cd /data
  unzip /tmp/alfresco-solr4-config-ssl.zip 
	cp -rv /config/* /data
fi



/tomcat/bin/catalina.sh run
