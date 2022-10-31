#!/bin/bash
#Failide varundamine

#Kontroll, kas kasutajal on root õigused
function checkRights(){
if [[ $EUID -ne 0 ]]; then
echo "This script must be run as root"
exit 1
fi
}

function backup(){
USER_HOME=$(eval echo ~${SUDO_USER})
echo $USER_HOME

read -p "Kust kaustast faile kopeerin? " file_location
read -p "Mis faile kopeerin? " -a files
backup_folder=$USER_HOME/Skriptimisvahendid/backups
file_location=$USER_HOME/Skriptimisvahendid/$file_location

if [ -d "$backup_folder" ]; then
echo "Loon varukoopiat kausta $backup_folder"
else 
echo "Ei ole kausta varukoopiate jaoks. Loon."
mkdir $backup_folder
echo "$backup_folder on loodud"
fi

for i in "${files[@]}"; do
echo $i
cp $file_location/$i $backup_folder
echo "$file_location/$i kopeeritud asukoha $backup_folder"
done

}

#checkRights
backup