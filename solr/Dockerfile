FROM marsbard/tomcat

VOLUME /data    # would normally be in .../solr4
VOLUME /content # would normally be in .../alf_data/solr

COPY files/tmp/solr4.war /tomcat/webapps
RUN mkdir /data
ADD files/tmp/alfresco-solr4-config-ssl.zip /data
