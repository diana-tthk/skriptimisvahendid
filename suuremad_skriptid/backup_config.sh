#!/bin/bash
#backup folders
backupDir=~/"Skriptimisvahendid/backup"

if [ -d "$backupDir" ]; then
echo "Loon varukoopiat kausta $backupDir"
else 
echo "Ei ole kausta varukoopiate jaoks. Loon."
mkdir $backupDir
echo "$backupDir on loodud"
fi

files=( ~/.bashrc
~/.bash_aliaces
~/.vimrc
~/.taskrc
/etc/fstab
/boot/grub/grub.cfg
/etc/apt/sources.list
/etc/hosts )

for file in ${files[@]}
do
echo "$file - trying to copy"
cp -fv $file $backupDir
done

tar cvf backup.tar $backupDir *