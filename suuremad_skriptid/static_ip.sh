#!/bin/bash
#DESCRIPTION: Skript, mis automatiseerib staatilise IP aadressi seadistamine

#Kontroll, kas kasutajal on root õigused
function checkRights(){
if [[ $EUID -ne 0 ]]; then
echo "This script must be run as root"
exit 1
fi
}

function getInfo(){
read -p "Enter the IP of your router (ex. 192.168.1.1): " adresses[0]

read -p "Enter the netmask for your network (ex. 255.255.255.0): " adresses[1]

read -p "Enter the static IP you want to set up (ex. 192.168.1.1): " adresses[2]

x=3
read -p "Enter the number of dns-nameserver addresses you have: " num

for ((i = 0; i < ${num}; i++)); do
read -p "Enter the dns-server address (ex. 192.168.1.1): " adresses[x]
((x=x+1))
done


function check(){
for ((i = 0; i < ${#addresses[@]}; i++ )); do

while [[ ! ${addresses[i]} =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; do
if [[ $i -eq 0 ]]; then
echo "Error: you need to enter router IP aadress (ex. 192.168.1.1): "
elif [[ $i -eq 1 ]]; then
echo "Error: you need to enter netmask aadress (ex. 255.255.255.0): "
elif [[ $i -eq 2 ]]; then
echo "Error: you need to enter valid IP aadress (ex. 192.168.1.1): "
else 
echo "Error: you need to enter dns-nameserver IP aadress (ex. 192.168.1.1): "
fi
read addresses[i]
done

done
}