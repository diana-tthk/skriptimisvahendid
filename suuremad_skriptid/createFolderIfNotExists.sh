#!/bin/bash
#Loome eraldi funktsiooni faili liigutamise loogikaga
#Küsime kasutajalt, kas ta tahab mingi tegevuse teha
#Selleks meil vaja mitte ainult lugeda, vaid ka analüüsida kasutaja sisendi
#Teeme alustuseks numbritega
#-eg kontrollib, kas kaks numbrit on samad nt: [ n1 -eq n2 ]
#-ge on tõene, kui esimene number on võrdne või suurem, kui teine. Nt. [ n1 -ge n2 ]
#-gt on tõene, kui esimene number on suurem, kui teine. Nt. [ n1 -gt n2 ]
#-le on tõene, kui esimene number on võrdne või väiksem, kui teine. Nt. [ n1 -le n2 ]
#-lt on tõene, kui esimene number on väiksem, kui teine. Nt. [ n1 -lt n2 ]
#-ne tõene, kui n1 ja n2 ei ole võrdsed. Nt. [ n1 -ne n2 ]

function moveFileCreateIfNotExists () {
if [ ! -f $2 ]
then 
    read -p "Kas loon $2? (1/0) " check
    if [ $check -eq 1 ]
    then 
      cd $1 
      touch $2
    else
      echo "Bye then!"
      exit 0
    fi
elif mv $2 $1
then 
echo "Fail on kausta sisse liigutatud"
else
echo "Midagi läks valesti"
fi
}

#Kommand, mis küsib kasutajalt andmed ja kohe salvestab need muutuja sisse
read -p "Mis nimega kausta kontrollin? " dir
#echo $dir
if [ -d $dir ]
then
echo "Selline kaust on süsteemis juba olemas"
else
echo "Kaust nimega $dir on loodud."
mkdir $dir
fi
echo "Nüüd saame tõsta looud kausta sisse mingi faili."

read -p "Kas soovid mingid failid kausta sisse liigutada? (1/0)" check

if [ $check -eq 1 ]
then
  read -p "Mis failid?" files
  for file in $files
  do
  moveFileCreateIfNotExists $dir $file
  done
else
echo "bye then!"
exit 0
fi

