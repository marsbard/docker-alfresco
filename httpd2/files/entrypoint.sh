#!/bin/sh

mkdir -p /data/lock

/usr/sbin/apache2 -DFOREGROUND
