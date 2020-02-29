#SOALSHIFT SISTEM OPERASI 2020_MODUL 01
##KELOMPOK C08

##### **IVAN ABDILLAH RAHMAN - 0511840000137**
##### **VANIA MEILANI TAQIYYAH - 05111840000045**

# **Nomor 1**
### Soal
```
1. Whits adalah seorang mahasiswa teknik informatika. Dia mendapatkan tugas praktikum
untuk membuat laporan berdasarkan data yang ada pada file “​ Sample-Superstore.tsv” ​ .
Namun dia tidak dapat menyelesaikan tugas tersebut. Laporan yang diminta berupa :
a. Tentukan wilayah bagian (region) mana yang memiliki keuntungan (profit) paling
sedikit
b. Tampilkan 2 negara bagian (state) yang memiliki keuntungan (profit) paling
sedikit berdasarkan hasil poin a
c. Tampilkan 10 produk (product name) yang memiliki keuntungan (profit) paling
sedikit berdasarkan 2 negara bagian (state) hasil poin b
Whits memohon kepada kalian yang sudah jago mengolah data untuk mengerjakan
laporan tersebut.
*Gunakan Awk dan Command pendukung
```
#### Penjelasan Soal
Soal 1 diminta untuk mengolah beberapa data yang telah ditentukan pada file "Sample-Superstore". 
##### Soal 1a
Menentukan wilayah bagian (region) yang memiliki jumlah profit paling kecil.
```
soal1a=$(awk -F '\t' 'NR>1 {kolom[$13]+=$21} END{for(i in kolom) print i ",", kolom[i]}' Sample-Superstore.tsv | sort -t, -n -k1 | awk -F, '{print $1}' | head -1
printf "$soal1a\n\n"
```
- `soal1a`, mendeklarasikan variabel untuk menyimpan hasil dari proses script itu sendiri.
- `awk -F `\t``, membaca separator pada file.
- `NR>1`, meloncati baris pertama yang berisi judul kolom pada file tersebut.
- `{kolom[$13]+=$21}`, menghitung jumlah nilai pada kolom ke-21 dari array 'kolom' yang memiliki nama yang sama pada kolom ke-13
` `END{for(i in kolom) print i ",", kolom[i]`, melakukan loop sebanyak 'index' (i) pada array 'kolom' dan mencetak 'index' (yang berisi nama-nama region' dan jumlah profit 
- `Sample-Superstore.tsv`, nama file 
- `sort -t, -n -k1`, mengurutkan nilai sesuai numerik dari yang terkecil ke terbesar. `-k1` adalah field pada kolom 1.
- `awk -F, '{print $1}`, mencetak kolom pertama dari hasil perintah sebelumnya
- `head -1`, mencetak hasil data urutan teratas dari daftar hasil data tersebut.

##### Soal 1b 
Menentukan dua state yang memiliki profit terkecil berdasarkan hasil data 1a.
``` 
soal1b=$(awk -F '\t' -v state="$soal1a" '($13~state) NR>1 {kolom[$11]+=$21} END{for(i in kolom) print i",",kolom[i]}' Sample-Superstore.tsv | sort -t, -g -k2 | awk -F, '{print $1}' | head -2)
```
- `-v state="$soal1a"-, mendeklarasikan variabel state yang berisi hasil dari soal 1a.
- `($13~state)`, memeriksa apakah data di kolom ke-13 terdapat string yang sama pada variabel state.
- `sort -t, -g -k2`, `g` mengurutkan nilai secara general sesuai field kolom ke-2.
- `head -2`, mencetak hasil dua data pertama dari data tersebut.

##### Soal 1c
Menentukan sepuluh nama produk yang memiliki profit terkecil berdasarkan hasil data 1b.
```
state1="Texas"
state2="Illinois"
awk -F '\t' -v state1="$state1" -v state2="$state2" '($11~state1) || ($11~state2) NR>1 {kolom[$17]+=$21} END{for(i in kolom) print i";",kolom[i]}' Sample-Superstore.tsv | sort -t; -g -k2 | awk -F, '{print $1}' | head -10
```
Script diatas sama halnya seperti pada soal 1b, hanya berbeda pada command : 
-`($11~state1) || ($11~state2)`, menggunakan operasi OR karena untuk mendapatkan hasil dari keduanya.


# **Nomor 2**
### Soal
```
Pada suatu siang, laptop Randolf dan Afairuzr dibajak oleh seseorang dan kehilangan
data-data penting. Untuk mencegah kejadian yang sama terulang kembali mereka
meminta bantuan kepada Whits karena dia adalah seorang yang punya banyak ide.
Whits memikirkan sebuah ide namun dia meminta bantuan kalian kembali agar ide
tersebut cepat diselesaikan. Idenya adalah kalian (a) membuat sebuah script bash yang
dapat menghasilkan password secara acak sebanyak 28 karakter yang terdapat huruf
besar, huruf kecil, dan angka. (b) Password acak tersebut disimpan pada file berekstensi
.txt dengan nama berdasarkan argumen yang diinputkan dan HANYA berupa alphabet.
(c) Kemudian supaya file .txt tersebut tidak mudah diketahui maka nama filenya akan di
enkripsi dengan menggunakan konversi huruf (string manipulation) yang disesuaikan
dengan jam(0-23) dibuatnya file tersebut dengan program terpisah dengan (misal:
password.txt dibuat pada jam 01.28 maka namanya berubah menjadi qbttxpse.txt
dengan perintah ‘bash soal2_enkripsi.sh password.txt’. Karena p adalah huruf ke 16 dan
file dibuat pada jam 1 maka 16+1=17 dan huruf ke 17 adalah q dan begitu pula
seterusnya. Apabila melebihi z, akan kembali ke a, contoh: huruf w dengan jam 5.28,
maka akan menjadi huruf b.) dan (d) jangan lupa untuk membuat dekripsinya supaya
nama file bisa kembali.
```
#### Penjelasan Soal
Soal 2 diminta untuk menyimpan random password di dalam sebuah file yang dapat dienkripsi maupun didekripsi.
##### Soal 2a
Membuat sebuah bash script yang dapat membuat sebuah random password secara acak sebanyak 28 karakter yang terdapat huruf
besar, huruf kecil, dan angka.
```
password=$1
code=$(< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c28)
echo $code
```
- `code`, mendeklarasikan variabel untuk menyimpan hasil dari proses script itu sendiri.
- `</dev/urandom tr -dc 'a-zA-Z0-9` deklarasi dan fungsi untuk membuat randomm password, deklarasi terdiri dari huruf a-z, A-Z, dan 0-9
- `head -c28`, huruf dan angka yang dihasilkan mencapai 28 karakter

##### Soal 2b 
Menyimpan password acak yang telah dihasilkan ke dalam sebuah file.txt, dengan ketentuan nama file hanya boleh diisi huruf alphabet.
```
password=$1
code=$(< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c28)

if [[ $password =~ [^0-9] || [:punct:] ]];
then
	newpass=$(echo $password | tr -cd [:alpha:])
fi

echo $code >> /home/vaniameith/Documents/${newpass}.txt
```
- `$password =~ [^0-9] || [:punct:]`, mendeteksi apakah inputan pada variable password terdapat angka atau special character (*^:, dll).
- `newpass=$(echo $password | tr -cd [:alpha:])`. Pada `echo $password` difungsikan untuk mengeluarkan hasil/output untuk dibaca pada command sebelah nya. `tr -cd [:alpha:]`, command untuk menghapus angka & spesial character dan hanya menyisakan inputan berupa alphabet saja.
- `echo $code`, menghasilkan output dari variabel code.
- `>> /home/vaniameith/Documents/${newpass}.txt`. Tanda `>>` untuk memindahkan output variabel code seluruhnya ke Directory yang dtuju. Pada script tersebut, output dipindahkan ke Documents dengan nama dari hasil variabel newpass dan tipedata `.txt`.

##### Soal 2c
Nama file yang telah dibuat kemudian dienkripsi dengan menggunakan konversi huruf (string manipulation) yang disesuaikan
dengan jam(0-23) dibuatnya file tersebut dengan program, misal jika huruf yang diketik adalah p dan dibuat pada pukul 01.28, p adalah huruf ke 16 dan file dibuat pada jam 1 maka 16+1=17 dan huruf ke 17 adalah q dan begitu pula seterusnya.
```
namafile=$1
newfile=${namafile%.*}

iniwaktu=$(ls -l $namafile | date +"%H" -r $namafile)

while [ $iniwaktu -gt 0 ]
do
	newfile=$(echo $newfile | tr '[a-zA-Z]' '[b-za-aB-ZA-A]')
	iniwaktu=`expr $iniwaktu - 1`
done

mv "$namafile" "$newfile.txt"
#echo $iniwaktu
#echo $newfile
```
- `newfile=${namafile%.*}`,command untuk memisahkan/memotong antara nama dengan tipefile. Sehingga, output dri variabel newfile adalah hanya nama file yang diinput.
- `iniwaktu=$(ls -l $namafile | date +"%H" -r $namafile)`. `ls -l $namafile` berfungsi untuk menampilkan waktu dari nama `$namafile` yang diinput. `date +"%H"` untuk menampilkan waktu berupa jam, dan `-r` berfungsi untuk membaca waktu 'jam' dari `$namafile` tersebut.
- Terdapat pengulangan yang memiliki syarat `$iniwaktu -gt 0` dimana hasil dari variabel iniwaktu lebih dari 0 yang berfungsi untuk menghitung berapa loncatan dari huruf awal ke huruf akhir dari proses pergesaran tersebut. Hal ini bertujuan untuk mengubah nama file dengan enkripsi.
- ` tr '[a-zA-Z]' '[b-za-aB-ZA-A]'`. `[a-zA-Z]` mendeklarasikan karakter yang boleh diubah pada nama file. Selanjutnya, `b-za-aB-ZA-A]` bagian dari pergesaran huruf satu persatu secara maju hingga looping berhenti. Perhentian huruf terakhir itulah yang akan mengganti nama file.
- ``iniwaktu=`expr $iniwaktu - 1``, bagian dari looping, dimana output pada variabel iniwaktu dikurangi 1 hingga sama dengan 0.
- `mv "$namafile" "$newfile.txt"`, mengganti nama file lama menjadi file baru.

##### Soal 2d
Melakukan dekripsi sehingga nama file kembali ke nama file lama.
```
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
```
Sama halnya seperti soal 2c, hanya berubah pada variabel newfile.

# **Nomor 3**
### Soal
```
1 tahun telah berlalu sejak pencampakan hati Kusuma. Akankah sang pujaan hati kembali ke naungan Kusuma? Memang tiada maaf bagi Elen. Tapi apa daya hati yang sudah hancur, Kusuma masih terguncang akan sikap Elen. Melihat kesedihan Kusuma, kalian mencoba menghibur Kusuma dengan mengirimkan gambar kucing. [a] Maka dari itu, kalian mencoba membuat script untuk mendownload 28 gambar dari "https://loremflickr.com/320/240/cat" menggunakan command wget dan menyimpan file dengan nama "pdkt_kusuma_NO" (contoh: pdkt_kusuma_1, pdkt_kusuma_2, pdkt_kusuma_3) serta jangan lupa untuk menyimpan log messages wget ke dalam sebuah file "wget.log". Karena kalian gak suka ribet, kalian membuat penjadwalan untuk menjalankan script download gambar tersebut. Namun, script download tersebut hanya berjalan[b] setiap 8 jam dimulai dari jam 6.05 setiap hari kecuali hari Sabtu Karena gambar yang didownload dari link tersebut bersifat random, maka ada kemungkinan gambar yang terdownload itu identik. Supaya gambar yang identik tidak dikira Kusuma sebagai spam, maka diperlukan sebuah script untuk memindahkan salah satu gambar identik. Setelah memilah gambar yang identik, maka dihasilkan gambar yang berbeda antara satu dengan yang lain. Gambar yang berbeda tersebut, akan kalian kirim ke Kusuma supaya hatinya kembali ceria. Setelah semua gambar telah dikirim, kalian akan selalu menghibur Kusuma, jadi gambar yang telah terkirim tadi akan kalian simpan kedalam folder /kenangan dan kalian bisa mendownload gambar baru lagi. [c] Maka dari itu buatlah sebuah script untuk mengidentifikasi gambar yang identik dari keseluruhan gambar yang terdownload tadi. Bila terindikasi sebagai gambar yang identik, maka sisakan 1 gambar dan pindahkan sisa file identik tersebut ke dalam folder ./duplicate dengan format filename "duplicate_nomor" (contoh : duplicate_200, duplicate_201). Setelah itu lakukan pemindahan semua gambar yang tersisa kedalam folder ./kenangan dengan format filename "kenangan_nomor" (contoh: kenangan_252, kenangan_253). Setelah tidak ada gambar di current directory, maka lakukan backup seluruh log menjadi ekstensi ".log.bak". Hint : Gunakan wget.log untuk membuat location.log yang isinya merupakan hasil dari grep "Location".
```
#### Penjelasan Soal
Soal 3 diminta untuk mendownload gambar dari link di soal, lalu gambar akan ter-download secara acak dan ada kemungkinan gambar tersebut sama denga gambar yang lainnya. Gambar akan didownload setiap 8 jam dimulai dari jam 6.05 setiap hari kecuali hari Sabtu. Karena ada kemungkinan gambar yang ter-download sama dan tidak ingin dianggap sebagai spam, maka gambar akan dipisah. Gambar yang identik akan dimasukkan ke folder /duplicate, gambar yang fix dikirim dimasukkan ke folder /kenangan.

##### Soal 3a
Membuat script untuk mendownload 28 gambar dari link menggunakan command wget dan menyimpan file dengan nama "pdkt_kusuma_1", "pdkt_kusuma_2", dst.
```
for ((a=1; a<29; a=a+1))
do 
wget -a /home/ivanar/Downloads/SoalShiftModul1SisopNo3/wget.log "https://loremflickr.com/320/240/cat" -O /home/ivanar/Downloads/SoalShiftModul1SisopNo3/pdkt_kusuma_$a.jpeg
done
```
- `for ((a=1; a<29; a++))`, melakukan iterasi agar fungsi berjalan sebanyak 28 kali.
- `do wget -a /home/ivanar/Downloads/SoalShiftModul1SisopNo3/wget.log "https://loremflickr.com/320/240/cat" -O /home/ivanar/Downloads/SoalShiftModul1SisopNo3/pdkt_kusuma_$a.jpeg`
`done`, fungsi untuk mengunduh gambar dan nama file gambar terdapat nomor urut.

##### Soal 3b
Membuat crontab untuk membuat jadwal download sesuai yang diminta soal
`crontab : 5 6-23/8 * * 0-5 bash /home/ivanar/soal3revisidownload.sh`, melakukan jadwal download sesuai soal

##### Soal 3c
Gambar akan ter-download secara acak dan ada kemungkinan gambar tersebut sama denga gambar yang lainnya. Karena ada kemungkinan gambar yang ter-download sama dan tidak ingin dianggap sebagai spam, maka gambar akan dipisah. Gambar yang identik akan dimasukkan ke folder /duplicate, gambar yang fix dikirim dimasukkan ke folder /kenangan. Setelah tidak ada gambar di current directory, maka lakukan backup seluruh log menjadi ekstensi ".log.bak".

`mkdir /home/ivanar/Downloads/SoalShiftModul1SisopNo3/kenangan
 mkdir /home/ivanar/Downloads/SoalShiftModul1SisopNo3/duplicate

 > /home/ivanar/Downloads/SoalShiftModul1SisopNo3/wget.log
 > /home/ivanar/Downloads/SoalShiftModul1SisopNo3/location.log

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
	
cat /home/ivanar/Downloads/SoalShiftModul1SisopNo3/wget.log >> /home/ivanar/Downloads/SoalShiftModul1SisopNo3/wget.log.bak`

`mkdir /home/ivanar/Downloads/SoalShiftModul1SisopNo3/kenangan
 mkdir /home/ivanar/Downloads/SoalShiftModul1SisopNo3/duplicate`, digunakan untuk membuat folder baru bernama kenangan dan duplicate, sesuai dengan permintaan soal
 
`> /home/ivanar/Downloads/SoalShiftModul1SisopNo3/wget.log
 > /home/ivanar/Downloads/SoalShiftModul1SisopNo3/location.log`, digunakan untuk membuat file wget.log dan location.log
 
`grep "Location" /home/ivanar/Downloads/SoalShiftModul1SisopNo3/wget.log > /home/ivanar/Downloads/SoalShiftModul1SisopNo3/location.log`, untuk mengambil kata 'location' pada wget.log, sehingga mempermudah untuk melakukan pengecekan gambara mana yang kembar

`readarray -t arr < /home/ivanar/Downloads/SoalShiftModul1SisopNo3/location.log
flag=0`, untuk membaca list array di location.log

`angkangelist=$(ls -1 /home/ivanar/Downloads/SoalShiftModul1SisopNo3/kenangan | wc -l)
angkangelist2=$(ls -1 /home/ivanar/Downloads/SoalShiftModul1SisopNo3/duplicate | wc -l)
flag=$((0))`, untuk melakukan deklarasi variabel untuk menghitung jumlah file di dalam folder

`for((i=0; i<$a; i=i+1)) 
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
done`, algoritma untuk membandingkan kedua variabel apakah indeksnya memiliki angka yang sama atau tidak. Jika bertemu dengan indeks yang sama, variabel nanti akan dipindahkan ke folder duplicate
	
`if [ $flag -eq 0 ] 
	then 
	mv /home/ivanar/Downloads/SoalShiftModul1SisopNo3/pdkt_kusuma_"$(($a+1))".jpeg /home/ivanar/Downloads/SoalShiftModul1SisopNo3/kenangan/kenangan_"$(($angkangelist+1))".jpeg
	echo case1
	else 
	echo case2
	mv /home/ivanar/Downloads/SoalShiftModul1SisopNo3/pdkt_kusuma_"$(($a+1))".jpeg /home/ivanar/Downloads/SoalShiftModul1SisopNo3/duplicate/duplicate_"$(($angkangelist2+1))".jpeg
	fi`, algoritma untuk memindahkan gambar yang sama ke folder duplicate dan sisanya ke folder kenangan
	
`cat /home/ivanar/Downloads/SoalShiftModul1SisopNo3/wget.log >> /home/ivanar/Downloads/SoalShiftModul1SisopNo3/wget.log.bak` , untuk melakukan backup seluruh log menjadi ekstensi ".log.bak".
