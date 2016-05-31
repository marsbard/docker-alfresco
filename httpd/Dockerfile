FROM httpd:2.4

VOLUME /data

RUN apt-get update && apt-get --no-install-recommends -y install openssl 

COPY files/httpd.conf.tpl /tmp/httpd.conf.tpl

# thanks to http://stackoverflow.com/a/2916159/370191, luckily our slightly bloated ubuntu base already has perl
# this script replaces any "${}" templates with their equivalent value from the same named enviromnent variable
RUN perl -p -i -e 's/\$\{([^}]+)\}/defined $ENV{$1} ? $ENV{$1} : $&/eg' < /tmp/httpd.conf.tpl > /usr/local/apache2/conf/httpd.conf

# remove conf file so our first run will generate it including templating the environment
RUN rm /usr/local/apache2/conf/httpd.conf


COPY files/httpd-foreground /usr/local/bin/httpd-foreground

COPY files/generate-certs.sh /generate-certs.sh

# we will copy these back in after mounting /etc/ssl externally
# and then generate the keys
RUN mv /etc/ssl /etc/ssl.orig
VOLUME /etc/ssl

EXPOSE 443
