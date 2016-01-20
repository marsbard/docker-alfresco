FROM marsbard/tomcat


RUN wget -q -c -O /tomcat/webapps/share.war https://artifacts.alfresco.com/nexus/service/local/repo_groups/public/content/org/alfresco/share/5.0.d/share-5.0.d.war

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



COPY files/share-config-custom.xml /tomcat/shared/classes/alfresco/web-extension/share-config-custom.xml
COPY files/log4j.properties /tomcat/shared/classes/alfresco/extension/log4j.properties
COPY files/video-thumbnail-context.xml /tomcat/shared/classes/alfresco/extension/video-thumbnail-context.xml
COPY files/video-transformation-context.xml /tomcat/shared/classes/alfresco/extension/video-transformation-context.xml
COPY files/server.xml /tomcat/conf/server.xml
COPY files/catalina.properties /tomcat/conf/catalina.properties

