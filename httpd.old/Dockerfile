FROM marsbard/tomcat

RUN echo 8.8.8.8 >> /etc/resolv.conf
RUN apt-get update 

RUN apt-get install -y python-setuptools \
                python-virtualenv 

ENV HTTPD_PREFIX /usr/local/apache2
ENV PATH $PATH:$HTTPD_PREFIX/bin
RUN mkdir -p "$HTTPD_PREFIX" \
	&& chown www-data:www-data "$HTTPD_PREFIX"
WORKDIR $HTTPD_PREFIX

# install httpd runtime dependencies
# https://httpd.apache.org/docs/2.4/install.html#requirements
RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		libapr1 \
		libaprutil1 \
		libapr1-dev \
		libaprutil1-dev \
		libpcre++0 \
		libssl1.0.0 \
	&& rm -r /var/lib/apt/lists/*

# see https://httpd.apache.org/download.cgi#verify
RUN gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B1B96F45DFBDCCF974019235193F180AB55D9977

ENV HTTPD_VERSION 2.2.31
ENV HTTPD_BZ2_URL https://www.apache.org/dist/httpd/httpd-$HTTPD_VERSION.tar.bz2

RUN buildDeps=' \
		ca-certificates \
		curl \
		bzip2 \
		gcc \
		libpcre++-dev \
		libssl-dev \
		make \
	' \
	set -x \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends $buildDeps \
	&& rm -r /var/lib/apt/lists/* \
	&& curl -SL "$HTTPD_BZ2_URL" -o httpd.tar.bz2 \
	&& curl -SL "$HTTPD_BZ2_URL.asc" -o httpd.tar.bz2.asc \
	&& gpg --verify httpd.tar.bz2.asc \
	&& mkdir -p src/httpd \
	&& tar -xvf httpd.tar.bz2 -C src/httpd --strip-components=1 \
	&& rm httpd.tar.bz2* \
	&& cd src/httpd \
	&& ./configure --enable-so --enable-ssl --prefix=$HTTPD_PREFIX --enable-mods-shared=most \
	&& make -j"$(nproc)" \
	&& make install \
	&& cd ../../ \
	&& rm -r src/httpd \
	&& sed -ri ' \
		s!^(\s*CustomLog)\s+\S+!\1 /proc/self/fd/1!g; \
		s!^(\s*ErrorLog)\s+\S+!\1 /proc/self/fd/2!g; \
		' /usr/local/apache2/conf/httpd.conf \
	&& apt-get purge -y --auto-remove $buildDeps
 


RUN apt-get update && apt-get -y upgrade

#RUN apt-get purge -y --auto-remove $buildDeps

RUN echo "nameserver 8.8.8.8" >> resolv.conf

RUN wget -O ~/master.zip https://github.com/letsencrypt/letsencrypt/archive/master.zip --no-check-certificate
RUN cd ~ && unzip master.zip 
RUN ls -alrt ~
COPY files/letsencrypt.ini /root/letsencrypt-master/letsencrypt.ini

#RUN pip install --upgrade ndg-httpsclient
RUN ls -alrt ~/letsencrypt-master

RUN apt-get update && apt-get -y upgrade

#RUN cd ~ && wget https://www.apache.org/dist/tomcat/tomcat-connectors/jk/tomcat-connectors-1.2.41-src.tar.gz 
#RUN cd ~ && tar -xvf tomcat-connectors-1.2.41-src.tar.gz
#RUN cd ~ && mv tomcat-connectors-1.2.41-src tomcat-connectors
#RUN cd ~ && cd tomcat-connectors/native && ls -artl && pwd 
#RUN tomcat-connectors/native/configure --with-apxs 
#RUN cd tomcat-connectors/native && make install
 
COPY files/httpd-foreground /usr/local/bin/httpd-foreground
#COPY files/alfresco.conf /etc/apache2/site-available/10-alfresco.conf
#COPY files/alfresco-ssl.conf /etc/apache2/site-available/25-alfresco-ssl.conf 
#RUN  ln -s /etc/apache2/site-available/10-alfresco.conf /etc/apache2/sites-enabled/10-alfresco.conf
#RUN  ln -s /etc/apache2/site-available/25-alfresco-ssl.conf /etc/apache2/sites-enabled/25-alfresco-ssl.conf
#COPY files/workers.properties /etc/libapache2-mod-jk/workers.properties
RUN echo "/root/letsencrypt-master/letsencrypt-auto --standalone --text -c /root/letsencrypt-master/letsencrypt.ini certonly -d londy.buzzdocs.com --email admin@buzzdocs.com --agree-tos" > /root/runletsencrypt.sh 
EXPOSE 80
CMD ["httpd-foreground"]

