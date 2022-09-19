#!/bin/bash
# Kasutame muutujad ja kasutaja sisendi
echo "Tere! Kellega ma räägin?"
read name
echo "Meeldiv tutvuda, $name"

#Matemaatilised operandid +, -, *, /, ()
# Matemaatiline tegevus peab vormistama $((a+b)) kujul
x=$1
var1=$(($x+2))
echo $var1
var1=$((($x+2)*2))
echo $var1
echo $(($x+2*2))