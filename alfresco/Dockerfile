FROM marsbard/tomcat

# http://layer0.authentise.com/docker-4-useful-tips-you-may-not-know-about.html
ENV DEBIAN_FRONTEND=noninteractive
RUN echo "deb mirror://mirrors.ubuntu.com/mirrors.txt trusty main restricted universe multiverse" > /etc/apt/sources.list && \
  echo "deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-updates main restricted universe multiverse" >> /etc/apt/sources.list && \
	echo "deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-security main restricted universe multiverse" >> /etc/apt/sources.list && \
	DEBIAN_FRONTEND=noninteractive apt-get update

# http://serverfault.com/a/634227
# See: http://fcorti.com/2014/10/13/how-to-install-alfresco-5-0-ubuntu-14-04-lts/
RUN apt-get update && apt-get --no-install-recommends -y install libjpeg62 libgif4 libart-2.0-2 libfreetype6 gsfonts libfontconfig1 imagemagick
RUN wget -P /tmp/ http://archive.canonical.com/ubuntu/pool/partner/s/swftools/swftools_0.9.0-0ubuntu2_amd64.deb
RUN dpkg -i /tmp/swftools_0.9.0-0ubuntu2_amd64.deb

RUN wget -q -c -O /tomcat/webapps/alfresco.war https://artifacts.alfresco.com/nexus/service/local/repo_groups/public/content/org/alfresco/alfresco/5.0.d/alfresco-5.0.d.war

RUN unzip /tomcat/webapps/alfresco.war -d /tomcat/webapps/alfresco
COPY files/server.xml /tomcat/conf/server.xml
COPY files/catalina.properties /tomcat/conf/catalina.properties
COPY files/alfresco-global.properties /tomcat/shared/classes/alfresco-global.properties
COPY files/video-thumbnail-context.xml /tomcat/shared/classes/alfresco/extension/video-thumbnail-context.xml
COPY files/video-transformation-context.xml /tomcat/shared/classes/alfresco/extension/video-transformation-context.xml
COPY files/tomcat-users.xml /tomcat/conf/tomcat-users.xml



COPY files/log4j.properties /tomcat/webapps/alfresco/WEB-INF/classes/log4j.properties

COPY files/java.security /usr/lib/jvm/java-8-oracle/jre/lib/security/java.security


RUN mkdir /tomcat/lib -p
RUN mkdir -p /tomcat/shared/lib
RUN wget -q -c -O /tmp/mysql.jdbc.zip http://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.37.zip
WORKDIR /tmp
RUN unzip mysql.jdbc.zip  mysql-connector-java-5.1.37/mysql-connector-java-5.1.37-bin.jar
RUN cp mysql-connector-java-5.1.37/mysql-connector-java-5.1.37-bin.jar /tomcat/lib/mysql.jdbc.jar


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


# TODO check if this is still necessary (remove and see if stuff breaks)
COPY files/nsswitch.conf /etc/nsswitch.conf


RUN mkdir /logs

VOLUME /data
VOLUME /logs

WORKDIR /tomcat
