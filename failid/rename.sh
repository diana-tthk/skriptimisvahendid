#!/bin/bash
#Teeme skripti, mis loob kausta sisse 10 faili ajatempliga
#ja siis otsib neid ülesse ja anab norm nimed
name='rename'
mkdir $name
cd $name

for i in {1..10}; do
sleep 1
touch $(date +%T).txt
done
sleep 2
for f in *.txt
do
mv $f "MinuFail_"$f
done