#!/bin/bash 

echo 'Disabling network interfaces…'
systemctl stop network-manager 
killall -9 dhclient 
for i in $(ifconfig | grep -iEo '^[ a-z0-9]+:' | grep -v '^lo:$' | cut -d ':' -f 1) 
do 
       ifconfig $i 0.0.0.0 down 
done 
