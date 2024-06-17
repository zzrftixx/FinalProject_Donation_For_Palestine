class Donasi {
  String id;
  String donaturId;
  double jumlah;
  String tanggal;
  String kategori;
  String status;

  Donasi({
    required this.id,
    required this.donaturId,
    required this.jumlah,
    required this.tanggal,
    required this.kategori,
    this.status = 'Pending',
  });

  get riwayatDistribusi => null;

  Map<String, String> toMap() {
    return {
      'id': id,
      'donaturId': donaturId,
      'jumlah': jumlah.toString(),
      'tanggal': tanggal,
      'kategori': kategori,
      'status': status,
    };
  }

  factory Donasi.fromMap(Map<String, String> map) {
    return Donasi(
      id: map['id']!,
      donaturId: map['donaturId']!,
      jumlah: double.parse(map['jumlah']!),
      tanggal: map['tanggal']!,
      kategori: map['kategori']!,
      status: map['status']!,
    );
  }
}
