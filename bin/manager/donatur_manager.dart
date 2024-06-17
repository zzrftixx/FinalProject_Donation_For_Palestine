import 'dart:io';
import '../model/donatur.dart';
import '../util/csv_util.dart';

class DonaturManager {
  List<Donatur> donaturList = [];
  Map<String, Donatur> donaturMap = {};

  void menuDonatur() {
    while (true) {
      print('1. Tambah Donatur');
      print('2. Tampilkan Donatur');
      print('3. Cari Donatur');
      print('4. Hapus Donatur');
      print('5. Edit Donatur');
      print('6. Keluar');
      stdout.write('Pilih opsi: ');
      String? choice = stdin.readLineSync();

      switch (choice) {
        case '1':
          tambahDonatur();
          break;
        case '2':
          tampilkanDonatur();
          break;
        case '3':
          cariDonatur();
          break;
        case '4':
          hapusDonatur();
          break;
        case '5':
          editDonatur();
          break;
        case '6':
          return;
        default:
          print('Pilihan tidak valid, silakan coba lagi.');
      }
    }
  }

  void tambahDonatur() {
    stdout.write('Masukkan ID Donatur: ');
    String? id = stdin.readLineSync();
    stdout.write('Masukkan Nama Donatur: ');
    String? nama = stdin.readLineSync();
    stdout.write('Masukkan Alamat Donatur: ');
    String? alamat = stdin.readLineSync();
    stdout.write('Masukkan Kontak Donatur: ');
    String? kontak = stdin.readLineSync();

    if (id != null && nama != null && alamat != null && kontak != null) {
      if (donaturMap.containsKey(id)) {
        print('ID Donatur sudah ada, silakan masukkan ID lain.');
      } else {
        Donatur donatur =
            Donatur(id: id, nama: nama, alamat: alamat, kontak: kontak);
        donaturList.add(donatur);
        donaturMap[id] = donatur;
        CsvUtil.writeToFile('donatur.csv', [donatur.toMap()]);
        print('Donatur berhasil ditambahkan.');
      }
    } else {
      print('Data tidak lengkap, silakan coba lagi.');
    }
  }

  void tampilkanDonatur() {
    donaturList = CsvUtil.readFromFile('donatur.csv').map((data) {
      return Donatur(
          id: data['id']!,
          nama: data['nama']!,
          alamat: data['alamat']!,
          kontak: data['kontak']!);
    }).toList();
    for (var donatur in donaturList) {
      print(
          '${donatur.id} - ${donatur.nama} - ${donatur.alamat} - ${donatur.kontak}');
    }
  }

  void cariDonatur() {
    stdout.write('Masukkan ID atau Nama Donatur: ');
    String? keyword = stdin.readLineSync();

    if (keyword != null && keyword.isNotEmpty) {
      var foundDonatur = donaturList
          .where((donatur) =>
              donatur.id.contains(keyword) || donatur.nama.contains(keyword))
          .toList();

      if (foundDonatur.isEmpty) {
        print('Donatur tidak ditemukan.');
      } else {
        for (var donatur in foundDonatur) {
          print(
              '${donatur.id} - ${donatur.nama} - ${donatur.alamat} - ${donatur.kontak}');
        }
      }
    } else {
      print('Keyword tidak valid, silakan coba lagi.');
    }
  }

  void hapusDonatur() {
    stdout.write('Masukkan ID Donatur yang ingin dihapus: ');
    String? id = stdin.readLineSync();

    if (id != null && donaturMap.containsKey(id)) {
      donaturMap.remove(id);
      donaturList.removeWhere((donatur) => donatur.id == id);

      // Tulis ulang semua data donatur ke file CSV dengan menimpa file
      var updatedData = donaturList.map((d) => d.toMap()).toList();
      CsvUtil.writeToFile('donatur.csv', updatedData, overwrite: true);

      print('Donatur berhasil dihapus.');
    } else {
      print('ID Donatur tidak ditemukan.');
    }
  }

  void editDonatur() {
    stdout.write('Masukkan ID Donatur yang ingin diedit: ');
    String? id = stdin.readLineSync();

    if (id != null && donaturMap.containsKey(id)) {
      var donatur = donaturMap[id];
      if (donatur != null) {
        stdout.write('Masukkan Nama Baru (${donatur.nama}): ');
        String? nama = stdin.readLineSync();
        stdout.write('Masukkan Alamat Baru (${donatur.alamat}): ');
        String? alamat = stdin.readLineSync();
        stdout.write('Masukkan Kontak Baru (${donatur.kontak}): ');
        String? kontak = stdin.readLineSync();

        if (nama != null && nama.isNotEmpty) donatur.nama = nama;
        if (alamat != null && alamat.isNotEmpty) donatur.alamat = alamat;
        if (kontak != null && kontak.isNotEmpty) donatur.kontak = kontak;

        donaturMap[id] = donatur;
        var index = donaturList.indexWhere((d) => d.id == id);
        if (index != -1) donaturList[index] = donatur;

        // Tulis ulang semua data donatur ke file CSV dengan menimpa file
        var updatedData = donaturList.map((d) => d.toMap()).toList();
        CsvUtil.writeToFile('donatur.csv', updatedData, overwrite: true);

        print('Donatur berhasil diperbarui.');
      }
    } else {
      print('ID Donatur tidak ditemukan.');
    }
  }
}
