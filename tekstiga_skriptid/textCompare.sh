#!/bin/bash
#[ str1 = str2 ] on tõene, kui str1 ja str2 on täpselt samad
#[ str1 != str2 ] on tõene, kui str1 ja str2 ei ole samad
#[ str1 \> str2 ] on tõene, kui str1 on str2 suurem
#[ str1 \< str2 ] on tõene, kui str1 on str2 väiksem
#[ -n str1 ] on tõene, kui str1 on pikem kui 0
#[ -z str1 ] on tõene, kui str1 on 0 pikkusega (ehk siis tühi)
str1="$1"
str2="$2"

if [ $str1 = $str2 ]
then 
echo "$str1 on sama kui $str2"
else
echo "$str1 ja $str2 ei ole võrdsed"
fi

if [ $str1 \> $str2 ]
then
echo "$str1 on suurem kui $str2"
else
echo "$str1 on väiksem kui $str2"
fi

if [ -n $str1 ]
then
echo "$str1 ei ole tühi"
else 
echo "$str1 on tühi"
fi

if [ -z $str2 ]
then 
echo "$str2 on tühi"
else
echo "$str2 ei ole tühi"
fi