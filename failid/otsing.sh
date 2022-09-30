#!/bin/bash
#Kirjutame skripti, mis looks names kausta sisse tänase kuupäevaga kausta
#ja siis tõstaks sinna kõik failid kindla nimi pattern'iga
cd names
nimi="$(date +%F)"
echo $nimi
if [ -d $nimi ]
then
echo "Kaust on juba olemas"
exit 0
fi
mkdir $nimi

readarray -d '' array < <(find . -type f -name 'log*.txt')
echo "${array[@]}"

for i in "${array[@]}"; do
mv $i $nimi
done