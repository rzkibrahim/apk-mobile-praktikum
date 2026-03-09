class ProfileModel {
  final String nama;
  final String nim;
  final String email;
  final String jurusan;
  final String angkatan;
  final String noHp;
  final String alamat;

  ProfileModel({
    required this.nama,
    required this.nim,
    required this.email,
    required this.jurusan,
    required this.angkatan,
    required this.noHp,
    required this.alamat,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      nama: json['nama'] ?? '',
      nim: json['nim'] ?? '',
      email: json['email'] ?? '',
      jurusan: json['jurusan'] ?? '',
      angkatan: json['angkatan'] ?? '',
      noHp: json['noHp'] ?? '',
      alamat: json['alamat'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nama': nama,
      'nim': nim,
      'email': email,
      'jurusan': jurusan,
      'angkatan': angkatan,
      'noHp': noHp,
      'alamat': alamat,
    };
  }
}