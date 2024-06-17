class Donatur {
  String id;
  String nama;
  String alamat;
  String kontak;

  Donatur(
      {required this.id,
      required this.nama,
      required this.alamat,
      required this.kontak});

  Map<String, String> toMap() {
    return {
      'id': id,
      'nama': nama,
      'alamat': alamat,
      'kontak': kontak,
    };
  }
}
