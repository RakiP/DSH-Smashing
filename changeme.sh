#!/bin/bash

: "${pathToListener:="$HOME/Documents/projects/DSHTesting/DSH-Smashing/py"}"
IP=`ifconfig | grep inet | grep -v inet6 | head -1 | awk '{print $2}' | cut -d':' -f2`
sed -i -e "s/IPADDRESS/$IP/g" "py/kafkaConsumerSmashing.py"
sed -i -e "s/IPADDRESS/$IP/g" "makefile"
sed -i -e "s#PATHTOLISTENER#$pathToListener#g" "makefile"