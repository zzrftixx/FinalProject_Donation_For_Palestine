import 'dart:collection';
import 'dart:io';

import 'class/donatur.dart';
import 'class/donasi.dart';
import 'class/avl_tree.dart';

List<Donatur> donaturList = [];
List<Donasi> donasiList = [];
Map<String, Donatur> donaturMap = {};
Map<String, Donasi> donasiMap = {};
Queue<Donasi> donasiQueue = Queue();
AVLTree<Donatur> avlDonaturTree = AVLTree();
AVLTree<Donasi> avlDonasiTree = AVLTree();

Map<String, List<String>> kategoriBarang = {
  "Makanan": ["Beras", "Air", "Mie Instan"],
  "Pakaian": ["Baju", "Celana", "Jaket"],
};

void main() {
  while (true) {
    print('Menu Utama:');
    print('1. Pendaftaran Donatur');
    print('2. Pencatatan Donasi');
    print('3. Pelacakan Distribusi Dana');
    print('4. Daftar Donatur');
    print('5. Daftar Donasi');
    print('6. Pembuatan Laporan Donasi');
    print('7. Pencarian');
    print('8. Keluar');
    print('Pilih opsi:');

    int? choice = int.tryParse(stdin.readLineSync()!);
    if (choice == null || choice < 1 || choice > 8) {
      print('Pilihan tidak valid. Silakan coba lagi.');
      continue;
    }

    switch (choice) {
      case 1:
        registerDonatur();
        break;
      case 2:
        recordDonation();
        break;
      case 3:
        processDonation();
        break;
      case 4:
        listDonors();
        break;
      case 5:
        listDonations();
        break;
      case 6:
        generateReport();
        break;
      case 7:
        searchMenu();
        break;
      case 8:
        exit(0);
    }
  }
}

void registerDonatur() {
  print('Masukkan ID Donatur:');
  String id = stdin.readLineSync()!;
  print('Masukkan Nama Donatur:');
  String nama = stdin.readLineSync()!;
  print('Masukkan Alamat Donatur:');
  String alamat = stdin.readLineSync()!;
  print('Masukkan No. Telepon Donatur:');
  String noTelepon = stdin.readLineSync()!;
  print('Masukkan Email Donatur:');
  String email = stdin.readLineSync()!;

  Donatur donatur = Donatur(id, nama, alamat, noTelepon, email);
  donaturList.add(donatur);
  donaturMap[id] = donatur;
  avlDonaturTree.insertNode(id, donatur);
  print('Donatur berhasil didaftarkan.');
}

void recordDonation() {
  print('Masukkan ID Donasi:');
  String id = stdin.readLineSync()!;
  print('Masukkan ID Donatur:');
  String idDonatur = stdin.readLineSync()!;
  print('Masukkan Jumlah Donasi:');
  int jumlah = int.parse(stdin.readLineSync()!);
  print('Masukkan Tanggal Donasi:');
  String tanggal = stdin.readLineSync()!;
  print('Masukkan Kategori Donasi:');
  String kategori = stdin.readLineSync()!;

  Donasi donasi = Donasi(id, idDonatur, jumlah, tanggal, kategori);
  donasiList.add(donasi);
  donasiMap[id] = donasi;
  donasiQueue.add(donasi);
  avlDonasiTree.insertNode(id, donasi);
  print('Donasi berhasil dicatat.');
}

void processDonation() {
  if (donasiQueue.isEmpty) {
    print('Tidak ada donasi yang perlu diproses.');
    return;
  }

  Donasi donasi = donasiQueue.removeFirst();
  donasi.status = "Terverifikasi";
  donasiMap[donasi.id] = donasi;
  print('Donasi berhasil diproses: ${donasi.id}');
}

void listDonors() {
  for (var donatur in donaturList) {
    print(donatur);
  }
}

void listDonations() {
  for (var donasi in donasiList) {
    print(donasi);
  }
}

void generateReport() {
  // Implementasi laporan donasi berdasarkan rentang tanggal, kategori, dsb.
}

void searchMenu() {
  print('Pilih opsi pencarian:');
  print('1. Cari Donatur berdasarkan ID');
  print('2. Cari Donatur berdasarkan Nama');
  print('3. Cari Donasi berdasarkan ID');
  print('4. Cari Donasi berdasarkan Tanggal');
  print('5. Kembali ke Menu Utama');
  int? choice = int.tryParse(stdin.readLineSync()!);
  if (choice == null || choice < 1 || choice > 5) {
    print('Pilihan tidak valid. Silakan coba lagi.');
    return;
  }

  switch (choice) {
    case 1:
      searchDonorById();
      break;
    case 2:
      searchDonorByName();
      break;
    case 3:
      searchDonationById();
      break;
    case 4:
      searchDonationByDate();
      break;
    case 5:
      return;
  }
}

void searchDonorById() {
  print('Masukkan ID Donatur:');
  String id = stdin.readLineSync()!;
  Donatur? donatur = donaturMap[id];
  if (donatur != null) {
    print(donatur);
  } else {
    print('Donatur tidak ditemukan.');
  }
}

void searchDonorByName() {
  print('Masukkan Nama Donatur:');
  String nama = stdin.readLineSync()!;
  donaturList
      .where((donatur) => donatur.nama.contains(nama))
      .forEach((donatur) {
    print(donatur);
  });
}

void searchDonationById() {
  print('Masukkan ID Donasi:');
  String id = stdin.readLineSync()!;
  Donasi? donasi = donasiMap[id];
  if (donasi != null) {
    print(donasi);
  } else {
    print('Donasi tidak ditemukan.');
  }
}

void searchDonationByDate() {
  print('Masukkan Tanggal Donasi:');
  String tanggal = stdin.readLineSync()!;
  donasiList
      .where((donasi) => donasi.tanggal.contains(tanggal))
      .forEach((donasi) {
    print(donasi);
  });
}
