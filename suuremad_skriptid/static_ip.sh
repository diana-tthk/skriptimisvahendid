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
}

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

function assign() {
routerip=${addresses[0]}
netmask=${addresses[1]}
static=${addresses[2]}
dns1=${addresses[3]}
dns2=${addresses[4]}
}

function writeInterface(){
cat << EOF > $1
#This file describes the network interfaces available on your system
#and how to activate them. For more information, see interfaces(5).

source /etc/network/interfaces.d/*

#The loopback network interface
auto lo
iface lo inet loopback

#The primary network interface
auto enp0s3
iface enp0s3 inet dhcp
        dns-nameservers $dns1 $dns2

#Your static network configuration
auto enp0s8
iface enp0s8 inet static
        address $static
        netmask $netmask
        gateway $routerip
EOF

echo ""
echo "Your info was saved into $1 file."
}

function update(){
echo "Updating primary network interface settings"
ifdown enp0s3
ifup enp0s3
echo "Updating secondary network interface"
ifdown enp0s8
ifup enp0s8
echo "Showing new config"
echo ""
ifconfig -a
}

file="/etc/network/interfaces"
if [[ ! -f $file ]]; then
echo ""
echo "File $file does not exist"
exit 1
fi

clear
checkRights
echo "Set static IP aadress"
getInfo
check
assign
echo ""
writeInterface $file
update
