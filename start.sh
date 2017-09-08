#!/bin/sh

apt-get update && apt-get -y upgrade openssh-server
service ssh start

while true ; do
	sleep 5000
done
