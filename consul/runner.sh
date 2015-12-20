#!/bin/sh

echo Copying config into place
cp -r /tmp/config/* /config

echo "Now running '$*'"
$*
