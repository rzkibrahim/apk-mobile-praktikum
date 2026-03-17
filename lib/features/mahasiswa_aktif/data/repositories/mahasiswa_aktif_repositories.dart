import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:modul_2/features/mahasiswa_aktif/data/models/mahasiswa_aktif_model.dart';

// ─── Versi HTTP ───────────────────────────────────────────────────
class MahasiswaAktifRepositoryHttp {
  Future<List<MahasiswaAktifModel>> getMahasiswaAktifList() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      headers: {'Accept': 'application/json'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      print(data); // Debug
      return data.map((json) => MahasiswaAktifModel.fromJson(json)).toList();
    } else {
      print('Error: ${response.statusCode} - ${response.body}');
      throw Exception('Gagal memuat data mahasiswa aktif: ${response.statusCode}');
    }
  }
}

// ─── Versi Dio ────────────────────────────────────────────────────
class MahasiswaAktifRepository {
  final Dio _dio = Dio();

  Future<List<MahasiswaAktifModel>> getMahasiswaAktifList() async {
    final response = await _dio.get(
      'https://jsonplaceholder.typicode.com/posts',
      options: Options(headers: {'Accept': 'application/json'}),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;
      print(data); // Debug
      return data.map((json) => MahasiswaAktifModel.fromJson(json)).toList();
    } else {
      throw Exception('Gagal memuat data mahasiswa aktif: ${response.statusCode}');
    }
  }
}