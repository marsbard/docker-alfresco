#!/bin/bash



if [ ! -f /etc/ssl/openssl.cnf ]
then
	cp /etc/ssl.orig/* /etc/ssl
	rm -rf /etc/ssl.orig
fi

if [ ! -f /etc/ssl/${DOMAIN_NAME}.cert ]
then
	echo Certificate not found, generating
	ls -l /usr/lib/ssl
	#export OPENSSL_CONF=/etc/ssl/openssl.cnf
  openssl req  -nodes -new -x509  -keyout /etc/ssl/${DOMAIN_NAME}.key -out /etc/ssl/${DOMAIN_NAME}.cert \
	  -subj '/CN=${DOMAIN_NAME}/O=Order Of The Bee/C=EU'
fi
