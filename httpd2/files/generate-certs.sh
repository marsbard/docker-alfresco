#!/bin/bash

if [ ! -f /etc/ssl/openssl.cnf ]
then
	cp /etc/ssl.orig/* /etc/ssl
	rm -rf /etc/ssl.orig
fi

if [ ! -f /etc/ssl/localhost.cert ]
then
	echo Certificate not found, generating
	ls -l /usr/lib/ssl
	#export OPENSSL_CONF=/etc/ssl/openssl.cnf
  openssl req  -nodes -new -x509  -keyout /etc/ssl/localhost.key -out /etc/ssl/localhost.cert \
	  -subj '/CN=localhost/O=Order Of The Bee/C=EU'
fi
