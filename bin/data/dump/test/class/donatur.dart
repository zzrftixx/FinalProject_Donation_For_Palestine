class Donatur {
  String id;
  String nama;
  String alamat;
  String noTelepon;
  String email;

  Donatur(this.id, this.nama, this.alamat, this.noTelepon, this.email);

  @override
  String toString() {
    return 'ID: $id, Nama: $nama, Alamat: $alamat, No. Telepon: $noTelepon, Email: $email';
  }
}
