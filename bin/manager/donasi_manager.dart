import 'dart:io';
import '../model/donasi.dart';
import '../util/csv_util.dart';
import 'donatur_manager.dart';

class DonasiManager {
  List<Donasi> donasiList = [];
  Map<String, Donasi> donasiMap = {};
  DonaturManager donaturManager;

  DonasiManager(this.donaturManager);

  void menuDonasi() {
    print('1. Tambah Donasi');
    print('2. Tampilkan Donasi');
    print('3. Cari Donasi');
    print('4. Filter Donasi');
    stdout.write('Pilih opsi: ');
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        tambahDonasi();
        break;
      case '2':
        tampilkanDonasi();
        break;
      case '3':
        cariDonasi();
        break;
      case '4':
        filterDonasi();
        break;
      default:
        print('Pilihan tidak valid, silakan coba lagi.');
    }
  }

  void tambahDonasi() {
    stdout.write('Masukkan ID Donasi: ');
    String? id = stdin.readLineSync();
    stdout.write('Masukkan ID Donatur: ');
    String? donaturId = stdin.readLineSync();
    stdout.write('Masukkan Jumlah Donasi: ');
    double? jumlah = double.tryParse(stdin.readLineSync() ?? '');
    stdout.write('Masukkan Tanggal Donasi (YYYY-MM-DD): ');
    String? tanggal = stdin.readLineSync();
    stdout.write('Masukkan Kategori Donasi: ');
    String? kategori = stdin.readLineSync();

    if (id != null &&
        donaturId != null &&
        jumlah != null &&
        tanggal != null &&
        kategori != null) {
      if (donasiMap.containsKey(id)) {
        print('ID Donasi sudah ada, silakan masukkan ID lain.');
      } else if (!donaturManager.donaturMap.containsKey(donaturId)) {
        print('ID Donatur tidak valid.');
      } else {
        Donasi donasi = Donasi(
            id: id,
            donaturId: donaturId,
            jumlah: jumlah,
            tanggal: tanggal,
            kategori: kategori);
        donasiList.add(donasi);
        donasiMap[id] = donasi;
        CsvUtil.writeToFile('donasi.csv', [donasi.toMap()]);
        print('Donasi berhasil ditambahkan.');
      }
    } else {
      print('Data tidak lengkap, silakan coba lagi.');
    }
  }

  void tampilkanDonasi() {
    donasiList = CsvUtil.readFromFile('donasi.csv').map((data) {
      return Donasi(
        id: data['id']!,
        donaturId: data['donaturId']!,
        jumlah: double.parse(data['jumlah']!),
        tanggal: data['tanggal']!,
        kategori: data['kategori']!,
      );
    }).toList();

    for (var donasi in donasiList) {
      print(
          '${donasi.id} - ${donasi.donaturId} - ${donasi.jumlah} - ${donasi.tanggal} - ${donasi.kategori} - ${donasi.status}');
    }
  }

  void cariDonasi() {
    stdout.write('Masukkan ID Donasi: ');
    String? id = stdin.readLineSync();

    if (id != null && donasiMap.containsKey(id)) {
      Donasi donasi = donasiMap[id]!;
      print(
          '${donasi.id} - ${donasi.donaturId} - ${donasi.jumlah} - ${donasi.tanggal} - ${donasi.kategori} - ${donasi.status}');
    } else {
      print('Donasi tidak ditemukan.');
    }
  }

  void filterDonasi() {
    stdout.write('Masukkan Kategori Donasi: ');
    String? kategori = stdin.readLineSync();
    stdout.write('Masukkan Status Donasi: ');
    String? status = stdin.readLineSync();

    if (kategori != null || status != null) {
      var result = donasiList
          .where((donasi) =>
              (kategori == null || donasi.kategori.contains(kategori)) &&
              (status == null || donasi.status.contains(status)))
          .toList();

      if (result.isNotEmpty) {
        for (var donasi in result) {
          print(
              '${donasi.id} - ${donasi.donaturId} - ${donasi.jumlah} - ${donasi.tanggal} - ${donasi.kategori} - ${donasi.status}');
        }
      } else {
        print('Donasi tidak ditemukan.');
      }
    } else {
      print('Filter tidak valid.');
    }
  }

  void laporanDonasi() {
    // Implementasi laporan dan analisis donasi
  }
}
