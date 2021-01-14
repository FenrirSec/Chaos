#!/usr/bin/env bash

RPI_IP=`bash discover.sh | grep -Eo 192.168.[0-9]+\.[0-9]+`
echo "Connecting to the RPI at $RPI_IP..."
ssh "lp1@$RPI_IP"