#!/bin/bash

# This utility manages a NATS streaming server running locally. It is primarily for development.
#
# Written by Capprin Bass on 08/07/2019


# Confirm we have docker and it's running
command -v docker > /dev/null 2>&1 || (echo >&2 "Docker not installed. Exiting."; exit 1; )
docker version > /dev/null 2>&1 || (echo >&2 "Docker isn't running. Exiting."; exit 1; )

function start {
	echo "Starting nats streaming server"
	docker start nats-streaming-dev 2>/dev/null || docker run -p 4222:4222 -p 8222:8222 --name nats-streaming-dev -d nats-streaming
}
function stop {
	echo "Stopping nats streaming server"
	docker stop nats-streaming-dev
}

# Options
if [ $# -ne 1 ]; then
	echo "No options supplied, or too many. Options are start, stop, restart, or reload."
	exit 1
elif [ $1 = "start" ]; then
	start
elif [ $1 = "stop" ]; then
	stop
elif [ $1 = "restart" ]; then
	stop
	start
elif [ $1 = "reload" ]; then
	echo "Running new build of nats-streaming"
	stop
	docker rm nats-streaming-dev
	start
else
	echo "Invalid option. Options are start, stop, restart, or reload."
fi
