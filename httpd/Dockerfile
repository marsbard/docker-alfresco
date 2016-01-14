FROM httpd:2.4

VOLUME /data

RUN apt-get update && apt-get -y install openssl

COPY files/httpd.conf /usr/local/apache2/conf/httpd.conf

COPY files/httpd-foreground /usr/local/bin/httpd-foreground

COPY files/generate-certs.sh /generate-certs.sh

# we will copy these back in after mounting /etc/ssl externally
# and then generate the keys
RUN mv /etc/ssl /etc/ssl.orig
VOLUME /etc/ssl

EXPOSE 443
