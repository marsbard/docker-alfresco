FROM marsbard/tomcat

COPY alfresco.war /tomcat/webapps
COPY server.xml /tomcat/conf/server.xml
COPY catalina.properties /tomcat/conf/catalina.properties
COPY alfresco-global.properties /tomcat/shared/classes/alfresco-global.properties

RUN mkdir /tomcat/lib -p
RUN wget https://jdbc.postgresql.org/download/postgresql-9.4-1205.jdbc42.jar -O /tomcat/lib/postgresql.jdbc.jar
