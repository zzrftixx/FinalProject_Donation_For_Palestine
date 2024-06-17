import 'dart:io';

import 'manager/donatur_manager.dart';
import 'manager/donasi_manager.dart';
import 'manager/distribusi_manager.dart';

void main() {
  DonaturManager donaturManager = DonaturManager();
  DonasiManager donasiManager = DonasiManager(donaturManager);
  DistribusiManager distribusiManager = DistribusiManager(donasiManager);

  while (true) {
    _tampilkanHeader();
    _tampilkanMenu();

    stdout.write('>> Pilih opsi: ');
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        donaturManager.menuDonatur();
        break;
      case '2':
        donasiManager.menuDonasi();
        break;
      case '3':
        distribusiManager.menuDistribusi();
        break;
      case '4':
        donasiManager.laporanDonasi();
        break;
      case '5':
        exit(0);
      default:
        print('Pilihan tidak valid, silakan coba lagi.');
    }
  }
}

void _tampilkanHeader() {
  print('''
      _____       _                               _____       
     / ____|     | |                             |  __ \\      
    | |  __  __ _| | __ _ _ __  __  _  __ _ _ __ | |  | | __ _ _ __  __  _ 
    | | |_ |/ _` | |/ _` | '_ \\|  _` |/ _` | '_ \\| |  | |/ _` | '_ \\|  _` |
    | |__| | (_| | | (_| | | | | (_| | (_| | | | | |__| | (_| | | | | (_| |
     \\_____|\\__,_|_|\\__,_|_| |_|\\__, |\\__,_|_| |_|_____/ \\__,_|_| |_|\\__,_|
                                __/ |                                    
                               |___/                                     

    ----=================================================----
    |   Aplikasi Management Donasi Untuk Keluarga Palestina   |
    ----=================================================----
    
    | Dev : @andraariesfi | Github : https://github.com/zzrftixx |
  ''');
}

void _tampilkanMenu() {
  print('''

    =============== Menu =============== 
    [1]. Pendaftaran dan Manajemen Donatur
    [2]. Pencatatan dan Manajemen Donasi
    [3]. Pelacakan Distribusi Dana
    [4]. Laporan dan Analisis Donasi
    [5]. Keluar
  ''');
}
