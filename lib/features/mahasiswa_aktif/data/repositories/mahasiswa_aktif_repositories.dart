import 'package:modul_2/features/mahasiswa/data/models/mahasiswa_model.dart';
import 'package:modul_2/features/mahasiswa/data/repositories/mahasiswa_repositories.dart';

class MahasiswaAktifRepository {
  final MahasiswaRepository _mahasiswaRepository = MahasiswaRepository();

  /// Mendapatkan daftar mahasiswa yang berstatus Aktif saja
  Future<List<MahasiswaModel>> getMahasiswaAktifList() async {
    final allMahasiswa = await _mahasiswaRepository.getMahasiswaList();
    return allMahasiswa
        .where((mahasiswa) => mahasiswa.status == 'Aktif')
        .toList();
  }
}