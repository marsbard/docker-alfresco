FROM httpd:2.4

VOLUME /data

RUN apt-get update && apt-get -y install openssl

COPY files/httpd.conf /usr/local/apache2/conf/httpd.conf

COPY files/httpd-foreground /usr/local/bin/httpd-foreground

COPY files/generate-certs.sh /generate-certs.sh
