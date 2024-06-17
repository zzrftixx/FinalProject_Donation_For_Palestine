import 'dart:io';
import '../model/distribusi.dart';
import '../util/csv_util.dart';
import 'donasi_manager.dart';

class DistribusiManager {
  List<Distribusi> distribusiList = [];
  Map<String, Distribusi> distribusiMap = {};
  DonasiManager donasiManager;

  DistribusiManager(this.donasiManager);

  void menuDistribusi() {
    print('1. Tambah Distribusi Dana');
    print('2. Tampilkan Distribusi Dana');
    stdout.write('Pilih opsi: ');
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        tambahDistribusi();
        break;
      case '2':
        tampilkanDistribusi();
        break;
      default:
        print('Pilihan tidak valid, silakan coba lagi.');
    }
  }

  void tambahDistribusi() {
    stdout.write('Masukkan ID Distribusi: ');
    String? id = stdin.readLineSync();
    stdout.write('Masukkan ID Donasi: ');
    String? donasiId = stdin.readLineSync();
    stdout.write('Masukkan Jumlah Distribusi: ');
    double? jumlah = double.tryParse(stdin.readLineSync() ?? '');
    stdout.write('Masukkan Tanggal Distribusi (YYYY-MM-DD): ');
    String? tanggal = stdin.readLineSync();
    stdout.write('Masukkan Penerima Manfaat: ');
    String? penerimaManfaat = stdin.readLineSync();

    if (id != null &&
        donasiId != null &&
        jumlah != null &&
        tanggal != null &&
        penerimaManfaat != null) {
      if (distribusiMap.containsKey(id)) {
        print('ID Distribusi sudah ada, silakan masukkan ID lain.');
      } else if (!donasiManager.donasiMap.containsKey(donasiId)) {
        print('ID Donasi tidak valid.');
      } else {
        Distribusi distribusi = Distribusi(
            id: id,
            donasiId: donasiId,
            jumlah: jumlah,
            tanggal: tanggal,
            penerimaManfaat: penerimaManfaat);
        distribusiList.add(distribusi);
        distribusiMap[id] = distribusi;
        CsvUtil.writeToFile('distribusi.csv', [distribusi.toMap()]);
        print('Distribusi dana berhasil ditambahkan.');
      }
    } else {
      print('Data tidak lengkap, silakan coba lagi.');
    }
  }

  void tampilkanDistribusi() {
    distribusiList = CsvUtil.readFromFile('distribusi.csv').map((data) {
      return Distribusi(
        id: data['id']!,
        donasiId: data['donasiId']!,
        jumlah: double.parse(data['jumlah']!),
        tanggal: data['tanggal']!,
        penerimaManfaat: data['penerimaManfaat']!,
      );
    }).toList();

    for (var distribusi in distribusiList) {
      print(
          '${distribusi.id} - ${distribusi.donasiId} - ${distribusi.jumlah} - ${distribusi.tanggal} - ${distribusi.penerimaManfaat}');
    }
  }
}
