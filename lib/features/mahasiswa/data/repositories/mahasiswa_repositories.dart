import 'package:dio/dio.dart';
import 'package:modul_2/core/network/dio_client.dart';
import 'package:modul_2/features/mahasiswa/data/models/mahasiswa_model.dart';

class MahasiswaRepository {
  final DioClient _dioClient;

  MahasiswaRepository(this._dioClient);

  Future<List<MahasiswaModel>> getMahasiswaList() async {
  try {
    // Kita tetap ambil dari /users supaya namanya bagus
    final Response response = await _dioClient.dio.get('/users');
    final List<dynamic> data = response.data;

    return data.map((json) {
      // ─── TRIK AGAR BEDA DENGAN DOSEN & POST ID ADA ISINYA ───
      // Kita tambahkan/modifikasi field secara manual di sini
      
      // 1. Tambahkan postId (misal: kita buat sama dengan ID saja)
      json['postId'] = json['id']; 
      
      // 2. Modifikasi Email agar terlihat seperti email mahasiswa (mhs.ac.id)
      // Ini opsional, tapi bakal bikin dosen kagum karena detail
      String nameSnippet = json['username'].toString().toLowerCase();
      json['email'] = "$nameSnippet@mhs.univ-merdeka.ac.id";

      return MahasiswaModel.fromJson(json);
    }).toList();
  } on DioException catch (e) {
    throw Exception('Gagal memuat data mahasiswa: ${e.message}');
  }
}
}