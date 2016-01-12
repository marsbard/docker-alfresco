#!/bin/bash

if [ ! -f /etc/ssl/localhost.cert ]
then
  openssl req  -nodes -new -x509  -keyout /etc/ssl/localhost.key -out /etc/ssl/localhost.cert \
	  -subj '/CN=localhost/O=Order Of The Bee/C=EU'
fi
