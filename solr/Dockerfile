FROM marsbard/tomcat

COPY files/tmp/solr4.war /tomcat/webapps

COPY files/solr4.xml /tomcat/conf/Catalina/localhost/solr4.xml

COPY files/solrconfig.xml /config/archive-SpacesStore/conf/solrconfig.xml
COPY files/solrconfig.xml /config/workspace-SpacesStore/conf/solrconfig.xml

COPY files/solrcore-workspace.properties /config/workspace-SpacesStore/conf/solrcore.properties
COPY files/solrcore-archive.properties /config/archive-SpacesStore/conf/solrcore.properties

COPY files/tmp/alfresco-solr4-config-ssl.zip /tmp

COPY files/server.xml /tomcat/conf/server.xml
COPY files/catalina.properties /tomcat/conf/catalina.properties


ADD files/tmp/keystore /keystore

# would normally be in .../solr4
VOLUME /data    
# would normally be in .../alf_data/solr
VOLUME /content 

VOLUME /config


COPY files/start.sh /
RUN chmod +x /start.sh

CMD ["/dns-bootstrap.sh", "/start.sh"]
