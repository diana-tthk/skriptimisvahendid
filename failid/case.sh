#!/bin/bash
#case konstruktsioon
cd files
#iga faili jaoks katalogis
for filename in $(ls)
do
#võtame faili lajend (extension)
ext=${filename##*\.}
#kui faili lajend langeb mingi nendest variantidest kokku, 
#trüki faili nimi ja selle lajendi seletus
case "$ext" in
c) echo "$filename : C source file"
;;
h) echo "$filename : C source file"
;;
o) echo "$filename : Object file"
;;
sh) echo "$filename : Shell script"
;;
txt) echo "$filename : text file"
;;
*) echo "$filename : not processed"
;;
esac
done