FROM httpd:2.4

#COPY files/localhost.conf /usr/local/apache2/conf/sites-enabled/localhost.conf

RUN mkdir /var/log/apache

COPY files/httpd.conf /usr/local/apache2/conf

COPY files/httpd-foreground /usr/local/apache
