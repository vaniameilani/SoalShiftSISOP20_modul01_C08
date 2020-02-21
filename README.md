#SOALSHIFT SISTEM OPERASI 2020_MODUL 01
##KELOMPOK C08

#### ***IVAN ABDILLAH RAHMAN - 0511840000137***
#### ***VANIA MEILANI TAQIYYAH - 05111840000045***

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
- `NR>1`, meloncati baris pertama yang berisi judul kolom pada file
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
- `($13~state)`, memeriksa apakah data di kolom ke-13 memiliki string pada variabel state.
- `sort -t, -g -k2`, `g` mengurutkan nilai secara general sesuai field kolom ke-2.
- `head -2`, mencetak hasil dua data pertama dari daftar hasil data tersebut.

##### Soal 1c
Menentukan sepuluh nama produk yang memiliki profit terkecil berdasarkan hasil data 1b.
```
state1="Texas"
state2="Illinois"
awk -F '\t' -v state1="$state1" -v state2="$state2" '($11~state1) || ($11~state2) NR>1 {kolom[$17]+=$21} END{for(i in kolom) print i";",kolom[i]}' Sample-Superstore.tsv | sort -t; -g -k2 | awk -F, '{print $1}' | head -10
```
- `($11~state1) || ($11~state2)`, menggunakan operasi OR karena untuk mendapatkan hasil dari keduanya.







