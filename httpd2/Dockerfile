FROM httpd:2.4

#COPY files/localhost.conf /usr/local/apache2/conf/sites-enabled/localhost.conf

RUN apt-get update && apt-get -y install openssl

RUN mkdir /var/log/apache

COPY files/httpd.conf /usr/local/apache2/conf/httpd.conf

COPY files/httpd-foreground /usr/local/apache
