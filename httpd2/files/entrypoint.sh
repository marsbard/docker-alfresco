#!/bin/sh

mkdir -p /data/lock /data/run /var/www/localhost

apache2 -X

echo Apache ended
