#!/bin/bash
#Program:
#	Put the dirctory into all nodes of the cluster as the same path. The nodes are in salvelist file. The slavelist file
#should be in the same path as this script and the format shouold be kept like "hostname ipaddr" in each line. 

#Description:
#2013/5/10	biaobiaoqi	First Release
#2013/5/22	biaobiaoqi	Add comments
if [ $# -lt 1 ]; then
   echo "Usage $0 DIR_PATH"
   exit 0
fi

for i in `cat slaveslist`
do
   ssh $i "rm ~/tmp -rf"
   scp -r $1 $i:~/tmp
   ssh $i "rm -rf $1;  mv ~/tmp $1"
done

