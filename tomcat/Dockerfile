# taken from https://github.com/dockerfile/java/blob/master/oracle-java8/Dockerfile
# docker build -t="dockerfile/ubuntu" github.com/dockerfile/ubuntu
# also from https://github.com/tutumcloud/tomcat/blob/master/8.0/Dockerfile

FROM ubuntu-upstart:trusty

RUN apt-get install -y --no-install-recommends  software-properties-common telnet netcat
RUN \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -yq --force-yes --no-install-recommends oracle-java8-installer  \
	  haveged \
    curl pwgen wget ca-certificates && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer


# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle


ENV TOMCAT_MAJOR_VERSION 8
ENV TOMCAT_MINOR_VERSION 8.0.11

# INSTALL TOMCAT
RUN wget -q https://archive.apache.org/dist/tomcat/tomcat-${TOMCAT_MAJOR_VERSION}/v${TOMCAT_MINOR_VERSION}/bin/apache-tomcat-${TOMCAT_MINOR_VERSION}.tar.gz && \
    wget -qO- https://archive.apache.org/dist/tomcat/tomcat-${TOMCAT_MAJOR_VERSION}/v${TOMCAT_MINOR_VERSION}/bin/apache-tomcat-${TOMCAT_MINOR_VERSION}.tar.gz.md5 | md5sum -c - && \
    tar zxf apache-tomcat-*.tar.gz && \
    rm apache-tomcat-*.tar.gz && \
    mv apache-tomcat* tomcat

RUN rm -fr /tomcat/webapps/*

EXPOSE 8080

ENV CATALINA_HOME /tomcat
CMD ["/tomcat/bin/catalina.sh",  "run"]

