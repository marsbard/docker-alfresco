FROM marsbard/tomcat

# haveged gets round the low-entropy == slow starting problem
RUN apt-get update && apt-get install haveged -y

VOLUME /data    # would normally be in .../solr4
VOLUME /content # would normally be in .../alf_data/solr

COPY files/tmp/solr4.war /tomcat/webapps

COPY files/solr4.xml /tomcat/conf/Catalina/localhost/solr4.xml

COPY files/solrconfig.xml /data/archive-SpacesStore/conf/solrconfig.xml
COPY files/solrconfig.xml /data/workspace-SpacesStore/conf/solrconfig.xml

COPY files/solrcore-workspace.properties /data/workspace-SpacesStore/conf/solrcore.properties
COPY files/solrcore-archive.properties /data/archive-SpacesStore/conf/solrcore.properties

ADD files/tmp/alfresco-solr4-config-ssl.zip /data
