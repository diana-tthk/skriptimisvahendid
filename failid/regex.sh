#!/bin/bash
#Katsetame mingid regulaar väljendid
#Regular expressions
#need on mustrid, mis kirjeldavad tekstid
#see on nagu matemaatika tekstidega ;)
#kui me paneme musri valmiks, siis saame sellega tekstid võrrelda ja leida need, mis mustrile vastavad
# . matches any single character
# ? preceeding item is optional and will be matched, at most, once
# * The preceding item will be matched zero or more times.
# + The preceding item will be matched one or more times.
# {N} The preceding item is matched exactly N times.
# {N,} The preceding item is matched N or more times.
# {N,M} The preceding item is matched at least N times, but not more than M times.
# - represents the range if it's not first or last in a list or the ending point of a range in a list.
# ^ Matches the empty string at the beginning of a line; also represents the characters not in the range of a list.
# $ Matches the empty string at the end of a line.
# \b 	Matches the empty string at the edge of a word.
# \B 	Matches the empty string provided it's not at the edge of a word.
# \< 	Match the empty string at the beginning of word.
# \> 	Match the empty string at the end of word.

# grep ^root source - otsib read, mis algavad sõnaga root
# '\<c....h\>' otsib kõik sõnad, kus on täpselt 5 tähte, millest esimene on c ja viimane on h

#Vahemikud ja klassid
# [a-cx-z]* - otsib read mis algavad "a", "b" "c" , "x", "y" või "z" tähega
# grep :$ /etc/passwd find users that have no shell assigned

#1. Kuvada kõik kasutajad, kelle shell on bin/bash
#2. kuva kõik read mis algavad 'daemon' sõnada failist /etc/group
#3. Kuvada kõik read failist, kust ei leia otsitvat sõnat
#4. Tee nimekirja failidest siit kaustast, mis olid muudetud vähem, kui 10 tunni tagasi (kaustad ei loe)
#5.Kuva kõik konfiguratsioon failid /etc kaustast, kus on nimi sees numbrid

echo "------------"
echo "------------"
echo "1."
grep :/bin/bash$ /etc/passwd
echo "------------"
echo "------------"
echo "2."
grep ^daemon /etc/group
echo "------------"
echo "------------"
echo "3."
IFS=$'\n'
read -p "Sõna, mis peab faili reast puuduma: " word
grep -wv "$word" test.txt
echo "------------"
echo "------------"
echo "4."
find . -type f -mmin -600
echo "------------"
echo "------------"
echo "5."
#echo /etc/*[[:digit:]]*.conf
find /etc -maxdepth 1 -type f -name "*[[:digit:]]*.conf" 