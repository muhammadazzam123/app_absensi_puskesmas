class User {
  int? id;
  String? username;
  String? nama;
  String? nip;
  String? jabatan;

  User({
    this.id,
    this.username,
    this.nama,
    this.nip,
    this.jabatan,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    nama = json['nama'];
    nip = json['nip'];
    jabatan = json['jabatan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['nama'] = nama;
    data['nip'] = nip;
    data['jabatan'] = jabatan;
    return data;
  }
}