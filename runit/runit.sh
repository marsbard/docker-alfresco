#!/bin/bash

/usr/sbin/runsvdir-start & 

tail -f /log/*/current
