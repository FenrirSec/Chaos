#!/usr/bin/env bash

echo "Searching for a connected Raspberry Pi"
IP=`ip --brief address show | grep wlan1 | grep -Eo 192.168.[0-9]+\.[0-9]+\/[0-9]+`
RPI=`nmap -sn -PE -T5 $IP | grep 'report for' | grep -Eo 192.168.[0-9]+\.[0-9]+`
echo "RPI is at $RPI"