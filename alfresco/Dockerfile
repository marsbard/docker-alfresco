FROM marsbard/tomcat

# http://serverfault.com/a/634227
# See: http://fcorti.com/2014/10/13/how-to-install-alfresco-5-0-ubuntu-14-04-lts/
RUN apt-get update && apt-get -y install libjpeg62 libgif4 libart-2.0-2 libfreetype6 gsfonts libfontconfig1
RUN wget -P /tmp/ http://archive.canonical.com/ubuntu/pool/partner/s/swftools/swftools_0.9.0-0ubuntu2_amd64.deb
#chmod a+x /tmp/swftools_0.9.0-0ubuntu2_amd64.deb
RUN dpkg -i /tmp/swftools_0.9.0-0ubuntu2_amd64.deb


COPY files/tmp/alfresco.war /tomcat/webapps
RUN unzip /tomcat/webapps/alfresco.war -d /tomcat/webapps/alfresco
COPY files/server.xml /tomcat/conf/server.xml
COPY files/catalina.properties /tomcat/conf/catalina.properties
COPY files/alfresco-global.properties /tomcat/shared/classes/alfresco-global.properties
COPY files/tomcat-users.xml /tomcat/conf/tomcat-users.xml

COPY files/log4j.properties /tomcat/webapps/alfresco/WEB-INF/classes/log4j.properties

ADD files/tmp/keystore /keystore

RUN mkdir /tomcat/lib -p
RUN mkdir -p /tomcat/shared/lib

RUN mkdir /logs

COPY files/tmp/mysql.jdbc.jar /tomcat/lib

VOLUME /data
VOLUME /logs
