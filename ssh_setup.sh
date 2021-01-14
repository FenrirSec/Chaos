#!/bin/env bash

RPI_IP=`bash discover.sh | grep -Eo 192.168.[0-9]+.[0-9]+`
echo "Sending files to the RPI at $RPI_IP"
scp ~/.ssh/id_rsa.pub "lp1@$RPI_IP:~/pubkey"
ssh lp1@$RPI_IP 'cat pubkey >> .ssh/authorized_keys'