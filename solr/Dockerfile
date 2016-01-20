FROM marsbard/tomcat

RUN wget -q -c -O /tomcat/webapps/solr4.war https://artifacts.alfresco.com/nexus/service/local/repo_groups/public/content/org/alfresco/alfresco-solr4/5.0.d/alfresco-solr4-5.0.d-ssl.war

COPY files/solr4.xml /tomcat/conf/Catalina/localhost/solr4.xml

COPY files/solrconfig.xml /config/archive-SpacesStore/conf/solrconfig.xml
COPY files/solrconfig.xml /config/workspace-SpacesStore/conf/solrconfig.xml

COPY files/solrcore-workspace.properties /config/workspace-SpacesStore/conf/solrcore.properties
COPY files/solrcore-archive.properties /config/archive-SpacesStore/conf/solrcore.properties

# This gets unpacked in /start.sh if necessary
RUN wget -q -c -O /tmp/alfresco-solr4-config-ssl.zip https://artifacts.alfresco.com/nexus/service/local/repo_groups/public/content/org/alfresco/alfresco-solr4/5.0.d/alfresco-solr4-5.0.d-config-ssl.zip

COPY files/tomcat-users.xml /tomcat/conf/tomcat-users.xml
COPY files/server.xml /tomcat/conf/server.xml
COPY files/catalina.properties /tomcat/conf/catalina.properties


# TODO we need to generate or copy in these files, not use default alfresco keys and keystore passwords
RUN mkdir /keystore
RUN wget -q -c -O /keystore/browser.p12 http://svn.alfresco.com/repos/alfresco-open-mirror/alfresco/HEAD/root/projects/repository/config/alfresco/keystore/browser.p12
RUN wget -q -c -O /keystore/generate_keystores.sh http://svn.alfresco.com/repos/alfresco-open-mirror/alfresco/HEAD/root/projects/repository/config/alfresco/keystore/generate_keystores.sh
RUN wget -q -c -O /keystore/keystore http://svn.alfresco.com/repos/alfresco-open-mirror/alfresco/HEAD/root/projects/repository/config/alfresco/keystore/keystore
RUN wget -q -c -O /keystore/keystore-passwords.properties http://svn.alfresco.com/repos/alfresco-open-mirror/alfresco/HEAD/root/projects/repository/config/alfresco/keystore/keystore-passwords.properties
RUN wget -q -c -O /keystore/ssl-keystore-passwords.properties http://svn.alfresco.com/repos/alfresco-open-mirror/alfresco/HEAD/root/projects/repository/config/alfresco/keystore/ssl-keystore-passwords.properties
RUN wget -q -c -O /keystore/ssl-truststore-passwords.properties http://svn.alfresco.com/repos/alfresco-open-mirror/alfresco/HEAD/root/projects/repository/config/alfresco/keystore/ssl-truststore-passwords.properties
RUN wget -q -c -O /keystore/ssl.keystore http://svn.alfresco.com/repos/alfresco-open-mirror/alfresco/HEAD/root/projects/repository/config/alfresco/keystore/ssl.keystore
RUN wget -q -c -O /keystore/ssl.truststore http://svn.alfresco.com/repos/alfresco-open-mirror/alfresco/HEAD/root/projects/repository/config/alfresco/keystore/ssl.truststore



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

