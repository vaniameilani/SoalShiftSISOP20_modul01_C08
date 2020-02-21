#!/bin/bash

for ((a=1; a<29; a++))
do wget -o wget.log https://loremflickr.com/320/240/cat -O pdkt_kusuma_$a.jpg
done

#crontab : 5 6-23/8 * * 0-5
