FROM marsbard/tomcat

VOLUME /data

COPY files/tmp/alfresco.war /tomcat/webapps
COPY files/server.xml /tomcat/conf/server.xml
COPY files/catalina.properties /tomcat/conf/catalina.properties
COPY files/alfresco-global.properties /tomcat/shared/classes/alfresco-global.properties

ADD files/tmp/keystore /keystore

RUN mkdir /tomcat/lib -p
RUN mkdir -p /tomcat/shared/lib
#RUN wget https://jdbc.postgresql.org/download/postgresql-9.4-1205.jdbc42.jar -O /tomcat/lib/postgresql.jdbc.jar
COPY files/tmp/postgresql.jdbc.jar /tomcat/lib
