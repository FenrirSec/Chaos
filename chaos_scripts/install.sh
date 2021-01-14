#!/usr/bin/env bash


CHAOS_USER="lp1"
echo "[ ~ Chaos setup ~ ]"
if [ "$EUID" -ne 0 ];then 
  echo "Please run as root"
  exit
fi
echo "chaos" >> /etc/hostname
if grep -q "$CHAOS_USER ALL=(ALL) NOPASSWD: ALL" /etc/sudoers
then 
   echo "Sudoers file has already been setup for $CHAOS_USER";
else
  echo "$CHAOS_USER ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
  echo "Added $CHAOS_USER to sudoers"
fi
