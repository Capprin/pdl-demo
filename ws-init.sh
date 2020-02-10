#!/bin/bash

# This utility manages a micronaut webservice for forwarding notifications from PDL. It is primarily for development.
#
# Written by Capprin Bass on 2/10/2019

function start {
  echo "Starting PDL micronaut notification service"
  node ./node_ws/app.js
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
