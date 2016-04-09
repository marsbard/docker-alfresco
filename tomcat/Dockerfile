# taken from https://github.com/dockerfile/java/blob/master/oracle-java8/Dockerfile
# docker build -t="dockerfile/ubuntu" github.com/dockerfile/ubuntu
# also from https://github.com/tutumcloud/tomcat/blob/master/8.0/Dockerfile

FROM marsbard/base

RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
	apt-get update && \
	apt-get install -y oracle-java8-installer unzip python-pip curl pwgen libtcnative-1 apache2-dev libapr1-dev libaprutil1-dev apache2 openssl && \
	rm -rf /var/lib/apt/lists/* && \
	rm -rf /var/cache/oracle-jdk8-installer 



# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle


ENV TOMCAT_MAJOR_VERSION 7
ENV TOMCAT_MINOR_VERSION 7.0.68
# http://mirror.vorboss.net/apache/tomcat/tomcat-7/v7.0.68/bin/apache-tomcat-7.0.68.tar.gz
# https://www.apache.org/dist/tomcat/tomcat-7/v7.0.68/bin/apache-tomcat-7.0.68.tar.gz.md5
# INSTALL TOMCAT
RUN wget -q http://mirror.vorboss.net/apache/tomcat/tomcat-${TOMCAT_MAJOR_VERSION}/v${TOMCAT_MINOR_VERSION}/bin/apache-tomcat-${TOMCAT_MINOR_VERSION}.tar.gz && \
    wget -qO- https://www.apache.org/dist/tomcat/tomcat-${TOMCAT_MAJOR_VERSION}/v${TOMCAT_MINOR_VERSION}/bin/apache-tomcat-${TOMCAT_MINOR_VERSION}.tar.gz.md5 | md5sum -c - && \
    tar zxf apache-tomcat-*.tar.gz && \
    rm apache-tomcat-*.tar.gz && \
    mv apache-tomcat* tomcat 

RUN cd /tomcat/bin && tar -zxvf tomcat-native.tar.gz && \
    cd tomcat-native*-src/jni/native && \
    pwd && ls -alrt /usr/bin/apr* && \
    mkdir -p /usr/local/apr && cp /usr/bin/apr-1-config /usr/local/apr && \
    ./configure --with-apr=/usr/local/apr --with-java-home=/usr/lib/jvm/java-8-oracle --with-ssl=$HOME/OPENSSL && make && make install 

RUN rm -fr /tomcat/webapps/*



EXPOSE 8080

ENV CATALINA_HOME /tomcat
ENV CATALINA_OPTS "-Djava.library.path=/usr/local/apr/lib"

CMD ["/tomcat/bin/catalina.sh", "run"]
