#!/bin/bash

namafile=$1
newfile=${namafile%.*}

iniwaktu=$(ls -l $namafile | date +"%H" -r $namafile)

while [ $iniwaktu -gt 0 ]
do
	newfile=$(echo $newfile | tr '[b-za-aB-ZA-A]' '[a-zA-Z]')
	iniwaktu=`expr $iniwaktu - 1`
done

mv "$namafile" "$newfile.txt"
#echo $iniwaktu
#echo $newfile

