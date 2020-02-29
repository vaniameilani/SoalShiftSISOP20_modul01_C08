#!/bin/bash


mkdir /home/ivanar/Downloads/SoalShiftModul1SisopNo3/kenangan
mkdir /home/ivanar/Downloads/SoalShiftModul1SisopNo3/duplicate

 > /home/ivanar/Downloads/SoalShiftModul1SisopNo3/wget.log
 > /home/ivanar/Downloads/SoalShiftModul1SisopNo3/location.log


for ((a=1; a<29; a=a+1))
do 
wget -a /home/ivanar/Downloads/SoalShiftModul1SisopNo3/wget.log "https://loremflickr.com/320/240/cat" -O /home/ivanar/Downloads/SoalShiftModul1SisopNo3/pdkt_kusuma_$a.jpeg
done

grep "Location" /home/ivanar/Downloads/SoalShiftModul1SisopNo3/wget.log > /home/ivanar/Downloads/SoalShiftModul1SisopNo3/location.log

readarray -t arr < /home/ivanar/Downloads/SoalShiftModul1SisopNo3/location.log
flag=0
for ((a=0; a<29; a=a+1))
do
	#echo $a
	angkangelist=$(ls -1 /home/ivanar/Downloads/SoalShiftModul1SisopNo3/kenangan | wc -l)
	angkangelist2=$(ls -1 /home/ivanar/Downloads/SoalShiftModul1SisopNo3/duplicate | wc -l)
	flag=$((0))

	for((i=0; i<$a; i=i+1)) 
	do 

	if [ $a -eq 0 ] 
	then mv /home/ivanar/Downloads/SoalShiftModul1SisopNo3/pdkt_kusuma_1.jpeg kenangan/kenangan_1.jpeg		
		elif [ "${arr[$a]}" == "${arr[$i]}" ] 
		then 
		flag=$((1))
		break

		elif [ "${arr[$i]}" == "((${arr[$i]}-1))" ]
		then
		flag=$((0))
		fi
		done
	
	if [ $flag -eq 0 ] 
	then 
	mv /home/ivanar/Downloads/SoalShiftModul1SisopNo3/pdkt_kusuma_"$(($a+1))".jpeg /home/ivanar/Downloads/SoalShiftModul1SisopNo3/kenangan/kenangan_"$(($angkangelist+1))".jpeg
	echo case1

	else 
	echo case2
	mv /home/ivanar/Downloads/SoalShiftModul1SisopNo3/pdkt_kusuma_"$(($a+1))".jpeg /home/ivanar/Downloads/SoalShiftModul1SisopNo3/duplicate/duplicate_"$(($angkangelist2+1))".jpeg
	fi

	done

cat /home/ivanar/Downloads/SoalShiftModul1SisopNo3/wget.log >> /home/ivanar/Downloads/SoalShiftModul1SisopNo3/wget.log.bak
cat /home/ivanar/Downloads/SoalShiftModul1SisopNo3/location.log >> /home/ivanar/Downloads/SoalShiftModul1SisopNo3/location.log.bak
