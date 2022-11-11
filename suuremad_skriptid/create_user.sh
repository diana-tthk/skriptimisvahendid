#!/bin/bash
#Kasutaja loomine

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

