#!/usr/bin/env bash

LOCAL=$(cat /root/last-ip)
PUBLIC=$(curl ifconfig.me)

if [ $LOCAL != $PUBLIC ]
then
  echo "IP updated"
  curl 'https://freedns.afraid.org/dynamic/update.php?eGFYU09PWlQ0Q1ZVa3gyT3BqWXpNVWdLOjIyNDI3NTc5'
  echo $PUBLIC > /root/last-ip
fi
