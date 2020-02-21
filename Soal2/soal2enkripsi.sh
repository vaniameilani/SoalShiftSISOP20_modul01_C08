#!/bin/bash

#newpass=$1
#code=$(</dev/urandom tr -dc 'a-zA-Z0-9' | head -c 28)
#echo $code > "$newpass".txt

echo -c "Nama file : "
read file_sebelum

jam=$(date + "%H")

#declare array
hurufbesar=({A..Z})
hurufkecil=({a..z})

hrfA=${hurufbesar[(0+$jam)]}
hrfZ=${hurufbesar[(25+jam)%26]}
hrfa=${hurufkecil[(0+$jam]}
hrfz=${hurufkecil[(25+jam)%26]}

#nama file setelah dienkripsi
file_setelah="$(echo "${file_sebelum}" | tr [A-Z] ["${hrfA}"-ZA-"${hrfZ}"] | tr [a-z] ["${hrfa}"-za-"${hrfz}")"

# Buat file-nya
echo "$code" > "${file_setelah}.txt"
