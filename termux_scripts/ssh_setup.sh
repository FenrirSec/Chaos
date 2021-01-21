#!/bin/env bash

echo "Username?"
read USERNAME
RPI_IP=`bash discover.sh | grep -Eo 192.168.[0-9]+.[0-9]+`
echo "Sending files to the RPI at $RPI_IP"
scp ~/.ssh/id_rsa.pub "$USERNAME@$RPI_IP:~/pubkey"
ssh $USERNAME@$RPI_IP 'mkdir .ssh && cat pubkey >> .ssh/authorized_keys;rm pubkey'
