#!/bin/bash
#Program:
#	Execute instructions in slaves who are in the slaveslist file. The salvelist file should be in the same path
#as this script and the format shouold be kept like "hostname ipaddr" in each line. 
#Description:
#2013/5/8	biaobiaoqi	First Release
#2013/5/10	biaobiaoqi	Fixed bugs in ssh.
#2013/5/22	biaobiaoqi	Add some comments.
if [ $# -lt 1 ]; then
   echo  "usage: $0 COMMAND" 
   exit 0
fi

for i in `cat slaveslist`
do
   ssh $i "$1"
done

