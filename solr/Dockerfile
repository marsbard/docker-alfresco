FROM marsbard/tomcat

ADD https://artifacts.alfresco.com/nexus/service/local/repo_groups/public/content/org/alfresco/alfresco-solr4/5.0.d/alfresco-solr4-5.0.d-ssl.war /tomcat/webapps/solr4.war

COPY files/solr4.xml /tomcat/conf/Catalina/localhost/solr4.xml

COPY files/solrconfig.xml /config/archive-SpacesStore/conf/solrconfig.xml
COPY files/solrconfig.xml /config/workspace-SpacesStore/conf/solrconfig.xml

COPY files/solrcore-workspace.properties /config/workspace-SpacesStore/conf/solrcore.properties
COPY files/solrcore-archive.properties /config/archive-SpacesStore/conf/solrcore.properties

COPY files/tmp/alfresco-solr4-config-ssl.zip /tmp


COPY files/tomcat-users.xml /tomcat/conf/tomcat-users.xml
COPY files/server.xml /tomcat/conf/server.xml
COPY files/catalina.properties /tomcat/conf/catalina.properties


ADD files/tmp/keystore /keystore

# would normally be in .../solr4
VOLUME /data    
# would normally be in .../alf_data/solr
VOLUME /content 

VOLUME /config

RUN mkdir /logs
VOLUME /logs

COPY files/start.sh /
RUN chmod +x /start.sh

CMD ["/start.sh"]

