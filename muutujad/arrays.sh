#!/bin/bash
#Arrays, massivid
echo "Nimede loetelu"
read -p "Kirjuta 3 nime: " -a nimed
echo "--------"
echo "Nimed on ${nimed[0]}, ${nimed[1]} ja ${nimed[2]}"
echo "--------"
echo "--------"
#Massivi elemenid
echo "Esimene: ${nimed[0]}"
echo "--------"
echo "Viimane: ${nimed[-1]}"
echo "--------"
echo "Elementide arv: ${#nimed[@]}"
echo "--------"
echo "Kõik: ${nimed[@]}"
echo "--------"
echo "--------"
#Massiivist eemaldamine
unset nimed[1]
echo "--------"
echo "--------"
echo "Esimene: ${nimed[0]}"
echo "--------"
echo "Viimane: ${nimed[-1]}"
echo "--------"
echo "Elementide arv: ${#nimed[@]}"
echo "--------"
echo "Kõik: ${nimed[@]}"
echo "--------"

#for tsükkel
for i in {1..10}; do
echo "Number: $i"
done
echo "--------"
#sammuga 2
for i in {1..20..2}; do
echo "Number: $i"
done
echo "--------"
#for tsükkel massiivi jaoks
for i in "${nimed[@]}"; do
echo "Nimi: $i"
done