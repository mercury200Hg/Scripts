#!/bin/bash
# Author : Harshit Gupta, mercury200Hg@gmail.com
# To start a service if not runninng, comes handy when service stops in production server as a temporary bandaid.

service=$1

if P=$(pgrep $service)
then
	echo "$service is running";
else
	/etc/init.d/$service start
fi
