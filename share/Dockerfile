FROM marsbard/tomcat

COPY files/tmp/share.war /tomcat/webapps/share.war

COPY files/share-config-custom.xml /tomcat/shared/classes/alfresco/web-extension/share-config-custom.xml

COPY files/log4j.properties /tomcat/shared/classes/alfresco/extension/log4j.properties

COPY files/video-thumbnail-context.xml /tomcat/shared/classes/alfresco/extension/video-thumbnail-context.xml
COPY files/video-transformation-context.xml /tomcat/shared/classes/alfresco/extension/video-transformation-context.xml


COPY files/server.xml /tomcat/conf/server.xml
COPY files/catalina.properties /tomcat/conf/catalina.properties


ADD files/tmp/keystore /keystore
