#!/bin/bash

# This utility manages a micronaut webservice for forwarding notifications from PDL. It is primarily for development.
#
# Written by Capprin Bass on 11/13/2019

# Confirm we have java
command -v java > /dev/null 2>&1 || (echo >&2 "Java not installed. Exiting."; exit 1; )

function start {
  echo "Starting PDL micronaut notification service"
  java -cp ProductClient.jar gov.usgs.earthquake.natsws.Application
}

# Options
if [ $# -ne 1 ]; then
	echo "No options supplied, or too many. Options are start."
	exit 1
elif [ $1 = "start" ]; then
	start
else
	echo "Invalid option. Options are start."
fi
