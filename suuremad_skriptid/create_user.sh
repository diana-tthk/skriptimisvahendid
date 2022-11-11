#!/bin/bash
#Kasutaja loomine

#Täiendada seda skripti
#1. saab panna mitu kasutajanimet järjest 
#2. kasutajanimed loetakse failist
#3. Küsime kasutajat, kas ta tahab lugeda kasutajanimed failist (siis las paneb faili nimi) või sisestada käsitsi (üks või mitu)

read -p "Username: " username
#saab ka nii:
#test=`grep -c "$username" /etc/passwd`
test=$(grep -c "$username" /etc/passwd)
if [ $test -eq 0 ]
then
read -p "Password: " password
useradd -m "$username" -p "$password"
else 
echo "User $username already exists"
fi

