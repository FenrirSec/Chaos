#!/usr/bin/env bash

echo "[ ~ Chaos setup ~ ]"
if [ "$EUID" -ne 0 ];then 
  echo "Please run as root"
  exit
fi
echo "chaos" >> /etc/hostname
echo "lp1 ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers