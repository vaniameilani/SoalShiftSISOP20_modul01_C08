#!/bin/bash

password=$1
code=$(< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c28)

if [[ $password =~ [^0-9] || [:punct:] ]];
then
	newpass=$(echo $password | tr -cd [:alpha:])
fi

echo $code >> /home/vaniameith/Documents/${newpass}.txt
