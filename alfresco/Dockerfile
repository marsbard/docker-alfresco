FROM marsbard/alfbase

ADD http://archive.canonical.com/ubuntu/pool/partner/s/swftools/swftools_0.9.0-0ubuntu2_amd64.deb /tmp/
ADD https://artifacts.alfresco.com/nexus/service/local/repo_groups/public/content/org/alfresco/alfresco/5.0.d/alfresco-5.0.d.war /tomcat/webapps/alfresco.war
ADD http://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.37.zip /tmp/mysql.jdbc.zip


# http://serverfault.com/a/634227
# See: http://fcorti.com/2014/10/13/how-to-install-alfresco-5-0-ubuntu-14-04-lts/
RUN apt-get update && apt-get -y install libjpeg62 libgif4 libart-2.0-2 libfreetype6 gsfonts libfontconfig1 imagemagick
RUN dpkg -i /tmp/swftools_0.9.0-0ubuntu2_amd64.deb
RUN rm -rf /tmp/swftools_0.9.0-0ubuntu2_amd64.deb

RUN unzip /tomcat/webapps/alfresco.war -d /tomcat/webapps/alfresco
COPY files/server.xml /tomcat/conf/server.xml
COPY files/catalina.properties /tomcat/conf/catalina.properties
COPY files/alfresco-global.properties /tomcat/shared/classes/alfresco-global.properties
COPY files/tomcat-users.xml /tomcat/conf/tomcat-users.xml

COPY files/log4j.properties /tomcat/webapps/alfresco/WEB-INF/classes/log4j.properties

COPY files/java.security /usr/lib/jvm/java-8-oracle/jre/lib/security/java.security

RUN mkdir /tomcat/lib -p
RUN mkdir -p /tomcat/shared/lib

RUN mkdir /logs

WORKDIR /tmp
RUN unzip mysql.jdbc.zip  mysql-connector-java-5.1.37/mysql-connector-java-5.1.37-bin.jar
RUN cp mysql-connector-java-5.1.37/mysql-connector-java-5.1.37-bin.jar /tomcat/lib/mysql.jdbc.jar
RUN rm -rf /tmp/mysql*
WORKDIR /
VOLUME /data
VOLUME /logs
