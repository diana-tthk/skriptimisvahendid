#!/bin/bash
#Special variables
echo $1 #Prints the first argument

#Create folder, add new file and go there
mkdir $2
touch $2/test.txt
echo Folder $2 created
cd $2
ls -l

#$0 name of the script
echo $0
#$# how many args
echo $#
#$@ all passed args
echo $@
#System variables
#sleep 3

echo $USER
echo $HOSTNAME
echo $SECONDS #number of secs since script started
echo $RANDOM
echo $LINENO #current line number in the script