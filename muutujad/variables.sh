#!/bin/bash
# Skript, mis prindib välja kasutaja ja kausta
echo "The current directory is:"
pwd
echo "The user logged in is:"
whoami
echo "Home for the current user is: $HOME"

# Muutujatega töötamine
# Muutujad võimaldavad kasutada skriptis väärtused, mis ei jää samaks
grade=5
person=$1
mydir=$(pwd) #Sama mis: mydir=`pwd`

echo "$person is a good boy, he is in grade $grade"
echo "I have \$1 in my pocket"
echo "My directory is: $mydir"
grade=3
echo "Bob is also a good boy, but he is in grade $grade"