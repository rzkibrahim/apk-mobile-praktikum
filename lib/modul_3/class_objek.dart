import 'dart:io';

// ============================================================
// BASE CLASS - Mahasiswa
// ============================================================
class Mahasiswa {
  String nama;
  int nim;
  String jurusan;

  Mahasiswa({required this.nama, required this.nim, required this.jurusan});

  void tampilkanData() {
    print('Nama    : $nama');
    print('NIM     : $nim');
    print('Jurusan : $jurusan');
  }
}

// ============================================================
// c. EXTENDS
// ============================================================

// Extends 1 - MahasiswaAktif
class MahasiswaAktif extends Mahasiswa {
  String semester;
  String statusKRS;

  MahasiswaAktif({
    required String nama,
    required int nim,
    required String jurusan,
    required this.semester,
    required this.statusKRS,
  }) : super(nama: nama, nim: nim, jurusan: jurusan);

  @override
  void tampilkanData() {
    super.tampilkanData();
    print('Semester  : $semester');
    print('Status KRS: $statusKRS');
    print('Status    : Mahasiswa Aktif');
  }
}

// Extends 2 - MahasiswaAlumni
class MahasiswaAlumni extends Mahasiswa {
  int tahunLulus;
  String pekerjaan;

  MahasiswaAlumni({
    required String nama,
    required int nim,
    required String jurusan,
    required this.tahunLulus,
    required this.pekerjaan,
  }) : super(nama: nama, nim: nim, jurusan: jurusan);

  @override
  void tampilkanData() {
    super.tampilkanData();
    print('Tahun Lulus: $tahunLulus');
    print('Pekerjaan  : $pekerjaan');
    print('Status     : Alumni');
  }
}

// ============================================================
// d. MIXIN
// ============================================================

// Mixin 1 - Mengajar
mixin Mengajar {
  List<String> mataKuliah = [];

  void tambahMataKuliah(String mk) {
    mataKuliah.add(mk);
    print('Mata kuliah "$mk" ditambahkan.');
  }

  void tampilkanMataKuliah() {
    print('Mata Kuliah yang diajarkan:');
    for (var mk in mataKuliah) {
      print('  - $mk');
    }
  }
}

// Mixin 2 - Penelitian
mixin Penelitian {
  List<String> daftarPenelitian = [];

  void tambahPenelitian(String judul) {
    daftarPenelitian.add(judul);
    print('Penelitian "$judul" ditambahkan.');
  }

  void tampilkanPenelitian() {
    print('Daftar Penelitian:');
    for (var p in daftarPenelitian) {
      print('  - $p');
    }
  }
}

// Mixin 3 - Jabatan
mixin Jabatan {
  String jabatan = '-';
  int masaJabatan = 0;

  void setJabatan(String j, int tahun) {
    jabatan = j;
    masaJabatan = tahun;
    print('Jabatan "$jabatan" selama $masaJabatan tahun berhasil diset.');
  }

  void tampilkanJabatan() {
    print('Jabatan      : $jabatan');
    print('Masa Jabatan : $masaJabatan tahun');
  }
}

// ============================================================
// Class Dosen - extends Mahasiswa + menggunakan 3 mixin
// ============================================================
class Dosen extends Mahasiswa with Mengajar, Penelitian, Jabatan {
  String nip;

  Dosen({
    required String nama,
    required int nim,
    required String jurusan,
    required this.nip,
  }) : super(nama: nama, nim: nim, jurusan: jurusan);

  @override
  void tampilkanData() {
    print('\n===== DATA DOSEN =====');
    print('Nama    : $nama');
    print('NIP     : $nip');
    print('Jurusan : $jurusan');
    tampilkanJabatan();
    tampilkanMataKuliah();
    tampilkanPenelitian();
  }
}

// ============================================================
// Class Fakultas - extends Mahasiswa + menggunakan 3 mixin
// ============================================================
class Fakultas extends Mahasiswa with Mengajar, Penelitian, Jabatan {
  String namaFakultas;
  String kodeFakultas;

  Fakultas({
    required String nama,
    required int nim,
    required String jurusan,
    required this.namaFakultas,
    required this.kodeFakultas,
  }) : super(nama: nama, nim: nim, jurusan: jurusan);

  @override
  void tampilkanData() {
    print('\n===== DATA FAKULTAS =====');
    print('Nama Fakultas : $namaFakultas');
    print('Kode Fakultas : $kodeFakultas');
    print('Ketua         : $nama');
    print('Jurusan       : $jurusan');
    tampilkanJabatan();
    tampilkanMataKuliah();
    tampilkanPenelitian();
  }
}

// ============================================================
// MAIN
// ============================================================
void main() {
  // --- Extends: MahasiswaAktif ---
  print('========================================');
  print('       MAHASISWA AKTIF');
  print('========================================');
  var mhsAktif = MahasiswaAktif(
    nama: 'Rizki',
    nim: 123456,
    jurusan: 'D4 Teknik Informatika',
    semester: '5',
    statusKRS: 'Sudah KRS',
  );
  mhsAktif.tampilkanData();

  print('');

  // --- Extends: MahasiswaAlumni ---
  print('========================================');
  print('       MAHASISWA ALUMNI');
  print('========================================');
  var mhsAlumni = MahasiswaAlumni(
    nama: 'Anang',
    nim: 654321,
    jurusan: 'D4 Teknik Informatika',
    tahunLulus: 2022,
    pekerjaan: 'Software Engineer',
  );
  mhsAlumni.tampilkanData();

  print('');

  // --- Mixin: Dosen ---
  print('========================================');
  print('       DOSEN (with Mixin)');
  print('========================================');
  var dosen = Dosen(
    nama: 'Dr. Budi Santoso',
    nim: 0,
    jurusan: 'Teknik Informatika',
    nip: '198501012010011001',
  );
  dosen.setJabatan('Kepala Program Studi', 4);
  dosen.tambahMataKuliah('Pemrograman Mobile');
  dosen.tambahMataKuliah('Basis Data');
  dosen.tambahPenelitian('Implementasi AI pada Sistem Informasi');
  dosen.tampilkanData();

  print('');

  // --- Mixin: Fakultas ---
  print('========================================');
  print('       FAKULTAS (with Mixin)');
  print('========================================');
  var fakultas = Fakultas(
    nama: 'Prof. Dr. Hendra Kusuma',
    nim: 0,
    jurusan: 'Teknik',
    namaFakultas: 'Fakultas Teknologi Informasi',
    kodeFakultas: 'FTI',
  );
  fakultas.setJabatan('Dekan Fakultas', 3);
  fakultas.tambahMataKuliah('Pengantar Teknologi Informasi');
  fakultas.tambahPenelitian('Pengembangan Smart Campus Berbasis IoT');
  fakultas.tambahPenelitian('Digitalisasi Layanan Akademik');
  fakultas.tampilkanData();
}