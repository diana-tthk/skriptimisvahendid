#!/bin/bash
# -d kontrollib, kas kaust on olemas
# -e kontrollib kas fail on olemas
# -f kontrollib, kas objekt on olemas ja kas see on fail
# -r kontrollib, kas seda faili saab lugeda
# -s kontrollb, kas fail on olemas ja kas on tühi
# -w kas on fail ja saame sinna kirjutada
# -x kas saame käivitada
# file1 -nt file2 kas file1 on faile2 noorem
# file1 -ot file2 kas file1 on file2 vanem

read -p "Kausta nimi: " dir
if [ ! -d $dir ]; then
mkdir $dir
else 
echo "Selle nimega kaust on juba olemas"
fi

read -p "Faili nimi: " file
cd $dir
if [ ! -f $file ]
then
echo "This is my new file" >> $file
cat $file
else 
echo "Selle nimega fail on juba olemas"
cat $file
fi
echo "-----"
echo "Add some lines to the file"
echo "-----"
check=1
while [ $check = 1 ]
do
read -p "Add to file: " line
echo $line >> $file

read -p "Kas soovid jätkata? (y/n) " ask
if [ "$ask" = "n" ]
then
  check=0
fi
done

#mitu rida faili sisse
printf "Hello, I'm %s.\n" $USER > file.txt
date +"Year: %Y, Month: %m, Day: %d" >> file.txt
cat << EOF >> file.txt
The current working directory is $PWD
You are logged in as $(whoami)
EOF

echo "$(<file.txt)"
echo "--------"
echo "--------"
#printida faili sõnade kaupa
for var in $(cat file.txt)
do
echo "$var"
done
echo "--------"
echo "--------"
#printida ridade kaupa
IFS=$'\n'
for var in $(cat file.txt)
do
echo "$var"
done