![cover](bin/data/dump/watermark.jpg)

------------------------------------
<p align="center">
  <h2 align="center">FinalProject - Apps Console Donation For Palestine</h2>
  <p align="center">
    Aplikasi ini di buat untuk Final Project Poliwangi
    <br/>
    <br/>
    <a href="https://github.com/zzrftixx"><strong>» Muhammad Andra Ariesfi »</strong></a>
    <br/>
  </p>
</p>
<p align="center">
<a href="https://github.com/zzrftixx"><img title="Autor" src="https://img.shields.io/badge/Author-zzrftixx-blue?style=for-the-badge&logo=github"></a> <a href="https://github.com/zzrftixx"><img title="Report" src="https://img.shields.io/badge/Copyring-2024-red?style=for-the-badge&logo=github"></a>
<p>
</p>
banyak dari kita sudah mengetahui lebih dari ribuan orang di palestina mengalami trauma berat, sekarat kelaparan, krisis medis, krisis air bersih, kerisis makanan, tidak adanya tempat berlindung akibat peperangan. yang mana ini membuat mereka harus menggali reruntuhan bangunan akibat peperangan, mengkorek” tumpukan sampah, sampai harus memakan rumput, kaktus dan pakan ternak harus mereka makan, untuk bertahan hidup.

Hingga saat ini, Insya Allah donasi terus berikhtiar temani perjuangan mereka dengan mengirim bantuan kemanusiaan dan meluaskan manfaat bantuan hingga ke Palestina, sebagai pemenuhan gizi buruk dan barang yang di perlukan keluarga Palestina.

maka dari itu Aplikasi "Management Pelacak dan Pencatatan Donasi untuk Palestina" adalah solusi inovatif berbasis konsol yang dirancang untuk meningkatkan transparansi, efisiensi, dan akuntabilitas dalam pengelolaan donasi untuk Palestina. Aplikasi ini memungkinkan organisasi kemanusiaan dan individu untuk mencatat, melacak, dan melaporkan donasi dengan mudah, memastikan bahwa setiap Donasi yang disumbangkan sampai ke mereka yang membutuhkan di Palestina.
</p>

# Dart command-line application 
aplikasi ini di tujukan oleh pengirim / orang yang mengirimkan donasi yang di berikan donatur ke palestina sebagai pencatatan dan pembuktian data donasi telah sampai ke mereka dan aplikasi ini secara akurat memberikan data pasti yang membantu donatur secara transparansi mengetahui donasi mereka tersampaikan, dengan pencatatan yang jelas, transparant, efisien. ini membantu pengiriman donasi mempunyai akuntabilitas yang akurat dan jelas. menghitung setiap donasi masuk dan barang apa saja yang di donasikan, tanggal berapa mereka berdonasi dan bukti donasi yang akurat dan status pengiriman donasi tersampaikan apa belum itu tujuan dari aplikasi ini.

Created from templates made available by Stagehand under a BSD-style
[license](https://github.com/dart-lang/stagehand/blob/master/LICENSE).

## Instalation !!
- Pastikan mempunyai dart SDK
- Anda bisa run pada file main.dart
- Jika Tidak Fitur Error buat Issues

```bash
dart bin/main.dart
# dart run main.dart
```


### Sedikit Tentang Page ini
- ✔️ | **Application Console** 

- ✔️ | **Fitur Utama dan Implementasi Concept Data Structure** 

- ✔️ | **Concept Data Structure** 

1. List:
Kegunaan:
Menyimpan daftar semua donatur (donaturList) dan donasi (donasiList).
Memudahkan iterasi untuk menampilkan daftar donatur dan donasi.
Menyimpan data barang pada setiap kategori di dalam Map kategoriBarang.
Mengapa Menggunakan List:
List adalah struktur data yang sederhana dan mudah digunakan di Dart.
Operasi penambahan (append) dan penghapusan (remove) elemen di akhir list memiliki kompleksitas waktu O(1), sehingga efisien untuk menambahkan donatur atau donasi baru.
List memungkinkan pengaksesan elemen secara acak berdasarkan indeks, meskipun dengan kompleksitas waktu O(n) untuk elemen di tengah.
Manfaat:
Memudahkan pengelolaan dan tampilan data donatur dan donasi.
Memungkinkan pengurutan data berdasarkan kriteria tertentu (nama, jumlah donasi, tanggal).

2. Map:
Kegunaan:
Menyimpan data donatur (donaturMap) dan donasi (donasiMap) dengan ID sebagai kunci.
Menyimpan daftar barang berdasarkan kategori di dalam Map kategoriBarang.
Mengapa Menggunakan Map:
Map memungkinkan pencarian sangat cepat (rata-rata O(1)) berdasarkan kunci (ID donatur atau ID donasi).
Ini sangat penting untuk mengakses informasi donatur atau donasi tertentu dengan efisien.
Manfaat:
Meningkatkan efisiensi pencarian data donatur dan donasi.
Memudahkan pengelompokan donasi berdasarkan kategori.
3. Queue:
Kegunaan:
Mengelola antrian donasi yang baru masuk (donasiQueue) dan perlu diproses lebih lanjut (misalnya, verifikasi pembayaran).
Mengapa Menggunakan Queue:
Queue memastikan bahwa donasi diproses secara berurutan sesuai dengan waktu masuknya (FIFO - First In, First Out).
Ini menjamin keadilan dan mencegah donasi terlewat atau diproses tidak berurutan.
Manfaat:
Memastikan pemrosesan donasi yang adil dan teratur.
4. Linked List:
Kegunaan:
Menyimpan riwayat donasi setiap donatur (riwayatDonasi dalam objek Donatur).
Menyimpan detail distribusi dana secara terurut berdasarkan waktu.
Mengapa Menggunakan Linked List:
Linked List efisien untuk menyisipkan elemen baru di awal (O(1)), yang sesuai untuk menambahkan donasi terbaru ke riwayat donasi.
Linked List juga fleksibel untuk menyimpan data yang bersifat sequential atau kronologis.
Manfaat:
Memudahkan pelacakan riwayat donasi setiap donatur.
Memungkinkan pelacakan distribusi dana secara kronologis.
5. AVL Tree:
Kegunaan:
Menyimpan data donatur (avlDonaturTree) dan donasi (avlDonasiTree) dengan ID sebagai kunci untuk pencarian yang lebih cepat dan efisien daripada pencarian linear pada List.
Mengapa Menggunakan AVL Tree:
AVL Tree adalah jenis Binary Search Tree (BST) yang selalu seimbang, sehingga menjamin kompleksitas waktu O(log n) untuk operasi pencarian, penyisipan, dan penghapusan.
Ini lebih efisien daripada pencarian linear pada List, terutama saat jumlah data semakin besar.
Manfaat:
Meningkatkan efisiensi pencarian donatur dan donasi berdasarkan ID.
Menjaga agar pohon tetap seimbang, sehingga kinerja pencarian tetap optimal.
Penyimpanan Data dengan CSV:
Mengapa Menggunakan CSV:
CSV adalah format file sederhana yang mudah dibaca dan ditulis oleh manusia dan program.
Cocok untuk aplikasi skala kecil atau prototipe karena mudah diimplementasikan.
Kelebihan:
Sederhana dan mudah digunakan.
Portable dan dapat dibuka dengan berbagai aplikasi (spreadsheet, text editor).


<div align="center">
  <h2>Let's make an annoyance free better open internet, altogether!</h2>
  <sub>A project by <a href="https://github.com/zzrftixx" target="_blank">Muh Andra Ariesfi</a> Dev <pub>
</div>


