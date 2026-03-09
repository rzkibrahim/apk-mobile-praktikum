import 'package:modul_2/features/mahasiswa/data/models/mahasiswa_model.dart';

class MahasiswaRepository {
  /// Mendapatkan daftar mahasiswa
  Future<List<MahasiswaModel>> getMahasiswaList() async {
    // Simulasi network delay
    await Future.delayed(const Duration(seconds: 1));

    // Data dummy mahasiswa
    return [
      MahasiswaModel(
        nama: 'Budi Santoso',
        nim: '434241001',
        email: 'budi.santoso@student.example.com',
        jurusan: 'Teknik Informatika',
        status: 'Aktif',
      ),
      MahasiswaModel(
        nama: 'Siti Rahayu',
        nim: '434241005',
        email: 'siti.rahayu@student.example.com',
        jurusan: 'Teknik Informatika',
        status: 'Aktif',
      ),
      MahasiswaModel(
        nama: 'Agus Pratama',
        nim: '434241009',
        email: 'agus.pratama@student.example.com',
        jurusan: 'Teknik Informatika',
        status: 'Lulus',
      ),
      MahasiswaModel(
        nama: 'Dewi Kusuma',
        nim: '434241013',
        email: 'dewi.kusuma@student.example.com',
        jurusan: 'Teknik Informatika',
        status: 'Aktif',
      ),
      MahasiswaModel(
        nama: 'Reza Firmansyah',
        nim: '434241017',
        email: 'reza.firmansyah@student.example.com',
        jurusan: 'Teknik Informatika',
        status: 'Lulus',
      ),
    ];
  }
}