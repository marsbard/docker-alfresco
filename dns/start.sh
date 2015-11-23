#!/bin/bash

# run the passed in arguments in the background
$* &

# and now run the real service
# from https://hub.docker.com/r/skurtzemann/tinydns/~/dockerfile/
/init.sh
