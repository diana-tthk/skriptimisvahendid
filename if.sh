#!/bin/bash
#Simple if 
if pwd
then
echo "It works!"
fi

#if-else 
user=$1
if grep $user /etc/passwd
then
echo "User $user exists in the system"
else
echo "User $user does not exist"
fi