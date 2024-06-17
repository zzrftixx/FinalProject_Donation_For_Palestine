import 'dart:io';

class CsvUtil {
  static void writeToFile(String fileName, List<Map<String, String>> data,
      {bool overwrite = false}) {
    File file = File(fileName);
    List<String> lines = [];

    if (!overwrite && file.existsSync()) {
      lines = file.readAsLinesSync();
    }

    for (var map in data) {
      lines.add(map.values.join(','));
    }

    file.writeAsStringSync(lines.join('\n'));
  }

  static List<Map<String, String>> readFromFile(String fileName) {
    File file = File(fileName);
    List<Map<String, String>> data = [];

    if (file.existsSync()) {
      List<String> lines = file.readAsLinesSync();
      for (var line in lines) {
        List<String> values = line.split(',');
        if (fileName == 'donatur.csv') {
          data.add({
            'id': values[0],
            'nama': values[1],
            'alamat': values[2],
            'kontak': values[3],
          });
        } else if (fileName == 'donasi.csv') {
          data.add({
            'id': values[0],
            'donaturId': values[1],
            'jumlah': values[2],
            'tanggal': values[3],
            'kategori': values[4],
            'status': values[5],
          });
        }
      }
    }

    return data;
  }
}
