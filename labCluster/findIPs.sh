#!/bin/bash
#Program:
#Get used IPs from the local network.
#Description:
#2013/5/22	biaobiaoqi	First Release
ADDR=172.21.2.
for(( i=1; i<255;i++))
do
    TMP=`arping -c 1 "$ADDR$i" 2>>findIPs.log`
    echo $TMP | grep reply >/dev/null && echo $TMP | awk '{print $8" " $9}' >> vips.txt

done
