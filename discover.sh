#!/bin/env bash

echo "Searching for a connected Raspberry Pi..."
IP=`ip --brief address show | grep wlan1 | grep -Eo 192.168.[0-9]+\.[0-9]+\/[0-9]+`
PHONE_IP=`echo $IP | grep -Eo 192.168.[0-9]+\.[0-9]+`
RPI_IP=`nmap -sn -PE -T5 $IP 2> /dev/null | grep 'report for' | grep -v $PHONE_IP | grep -Eo 192.168.[0-9]+\.[0-9]+`
echo "RPI is at $RPI_IP"