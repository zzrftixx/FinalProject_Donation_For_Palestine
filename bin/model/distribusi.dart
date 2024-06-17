class Distribusi {
  String id;
  String donasiId;
  double jumlah;
  String tanggal;
  String penerimaManfaat;
  String status;

  Distribusi({
    required this.id,
    required this.donasiId,
    required this.jumlah,
    required this.tanggal,
    required this.penerimaManfaat,
    this.status = 'Pending',
  });

  Map<String, String> toMap() {
    return {
      'id': id,
      'donasiId': donasiId,
      'jumlah': jumlah.toString(),
      'tanggal': tanggal,
      'penerimaManfaat': penerimaManfaat,
      'status': status,
    };
  }

  factory Distribusi.fromMap(Map<String, String> map) {
    return Distribusi(
      id: map['id']!,
      donasiId: map['donasiId']!,
      jumlah: double.parse(map['jumlah']!),
      tanggal: map['tanggal']!,
      penerimaManfaat: map['penerimaManfaat']!,
      status: map['status']!,
    );
  }
}
