#!/bin/bash
run=1
while [ $run = 1 ]
do
read -p "Esimene number: " num1
read -p "Teine number: " num2
read -p "Millist operatsiooni peaks tegema? (liitmine, lahutamine, korrutamine, jagamine) " operator

if [ "$operator" = "liitmine" ] || [ "$operator" = "+" ]
then 
sum=$(($num1+$num2))
elif [ "$operator" = "lahutamine" ] || [ "$operator" = "-" ]
then
sum=$(($num1-$num2))
elif [ "$operator" = "korrutamine" ] || [ "$operator" = "*" ]
then
sum=$(($num1*$num2))
elif [ "$operator" = "jagamine" ] || [ "$operator" = "/" ]
then
  if [ $num2 = 0 ]
  then
  echo "Viga: ei saa jagada nulliga"
  else
  sum=$(($num1/$num2))
  fi
fi
echo "Tulemus on: $sum"
read -p "Kas soovid jätkata? (y/n) " check
if [ "$check" = "n" ]
then
  run=0
fi
done