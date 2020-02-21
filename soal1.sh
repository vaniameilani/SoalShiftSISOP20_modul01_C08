#!/bin/bash
printf "Soal no.1a : Region yang memiliki profit terkecil adalah \n"
soal1a=$(awk -F '\t' 'NR>1 {kolom[$13]+=$21} END{for(i in kolom) print i ",",kolom[i]}' Sample-Superstore.tsv | sort -t, -n -k1 | awk -F, '{print $1}' | head -1)
printf "$soal1a\n\n"

printf "Soal no.1b : Dua state yang memiliki profit terkecil adalah \n"
soal1b=$(awk -F '\t' -v state="$soal1a" '($13~state) NR>1 {kolom[$11]+=$21} END{for(i in kolom) print i",",kolom[i]}' Sample-Superstore.tsv | sort -t, -g -k2 | awk -F, '{print $1}' | head -2)
printf "$soal1b\n\n"

printf "Soal no.1c : Sepuluh product yang memiliki profit terkecil adalah \n"
state1="Texas"
state2="Illinois"
awk -F '\t' -v state1="$state1" -v state2="$state2" '($11~state1) || ($11~state2) NR>1 {kolom[$17]+=$21} END{for(i in kolom) print i";",kolom[i]}' Sample-Superstore.tsv | sort -t; -g -k2 | awk -F, '{print $1}' | head -10



