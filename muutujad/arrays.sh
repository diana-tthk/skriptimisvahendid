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
