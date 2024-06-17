class Donasi {
  String id;
  String idDonatur;
  int jumlah;
  String tanggal;
  String kategori;
  String status;

  Donasi(this.id, this.idDonatur, this.jumlah, this.tanggal, this.kategori,
      {this.status = "Pending"});

  @override
  String toString() {
    return 'ID Donasi: $id, ID Donatur: $idDonatur, Jumlah: $jumlah, Tanggal: $tanggal, Kategori: $kategori, Status: $status';
  }
}
