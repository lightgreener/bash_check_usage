#!/bin/env bash

# Centos 7
# Henry
# 02/06/2021
#

# set a availalbe
NCARD=$1

echo -e "In -------------------Out"
while true; do
# previous 
OLD_IN=$(cat /proc/net/dev |awk '/$NCARD/{print $2}')
OLD_OUT=$(cat /proc/net/dev |awk '/$NCARD/{print $10}')
sleep 1

# current 
NEW_IN=$(cat /proc/net/dev |awk '/$NCARD/{print $2}')
NEW_IN=$(cat /proc/net/dev |awk '/$NCARD/{print $10}')

# Get the diff

IN=$( print "%.1f%s" "$((($NEW_IN-$OLD_IN)/1024))" "KB/s")
OUT=$( print "%.1f%s" "$((($NEW_OUT-$OLD_OUT)/1024))" "KB/s")

# output 
echo "$IN  $OUT"
sleep 1


done
