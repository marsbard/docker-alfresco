FROM marsbard/tomcat

VOLUME /data

COPY files/tmp/alfresco.war /tomcat/webapps
COPY files/server.xml /tomcat/conf/server.xml
COPY files/catalina.properties /tomcat/conf/catalina.properties
COPY files/alfresco-global.properties /tomcat/shared/classes/alfresco-global.properties
COPY files/tomcat-users.xml /tomcat/conf/tomcat-users.xml

COPY files/log4j.properties /tomcat/shared/classes/log4j.properties

ADD files/tmp/keystore /keystore

RUN mkdir /tomcat/lib -p
RUN mkdir -p /tomcat/shared/lib

#COPY files/tmp/postgresql.jdbc.jar /tomcat/lib
COPY files/tmp/mysql.jdbc.jar /tomcat/lib
