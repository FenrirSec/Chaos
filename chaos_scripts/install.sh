#!/usr/bin/env bash


CHAOS_USER="lp1"
echo "[ ~ Chaos setup ~ ]"
if [ "$EUID" -ne 0 ];then 
  echo "Please run as root"
  exit
fi
echo "chaos" >> /etc/hostname

# Sudoers file configuration
if grep -q "$CHAOS_USER ALL=(ALL) NOPASSWD: ALL" /etc/sudoers
then 
   echo "- Sudoers file has already been configured for $CHAOS_USER";
else
  echo "$CHAOS_USER ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
  echo "Added $CHAOS_USER to sudoers"
fi

# Hosts file configuration
if grep -q "chaos" /etc/hosts
then
    echo "- Hosts file has already been configured for chaos"
else
    cp etc/hosts /etc/hosts
fi

# Interfaces file configuration
if grep -q "wpa_supplicant.conf" /etc/network/interfaces
then
    echo "- Interfaces file has already been configured"
else
    cp etc/network/interfaces /etc/network/interfaces
fi

#WPA_Supplicant file configuration
if grep -q 'network={' /etc/wpa_supplicant/wpa_supplicant.conf
then
    echo "- Wpa_supplicant file has already been configured"
else
    cp etc/wpa_supplicant/wpa_supplicant.conf /etc/wpa_supplicant/wpa_supplicant.conf    
fi

#Setup is done, rebooting
echo "Done. Rebooting in 3..."
sleep 3
reboot
