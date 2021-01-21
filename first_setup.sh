#!/bin/bash

IFACE=$1
IP=`ip --brief addr show $IFACE | grep -Eo 192.168.[0-9]+\.[0-9]+\/[0-9]+ 2> /dev/null`

echo " ~ [ Chaos Installation Script ] ~"
echo "	Make sure you edited the etc/wpa_supplicant/wpa_supplicant.conf file according to YOUR configuration !!!"
sleep 3
echo "ip is $IP"

echo "Scanning network"

nmap -sTV -p 22 $IP 2> /dev/null

echo "Enter Kali Linux device's IP address : "
read KALI_IP
echo "Please run sudo bash chaos_scripts/install.sh on the remote device"

sshpass -p kali scp -r chaos_scripts etc kali@192.168.0.30:~
sshpass -p kali ssh kali@$KALI_IP
