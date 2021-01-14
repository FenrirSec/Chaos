#!/usr/bin/env bash

echo "Searching for a connected Raspberry Pi"
IP=`ip addr wlan1 | grep -Eo 192.168.[0-9]+`
nmap -sn -PE -T5 "$IP.0/24"