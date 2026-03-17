import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:modul_2/features/dosen/data/models/dosen_model.dart';
import 'package:http/http.dart' as http;

// Versi HTTP
class DosenRepositoryHttp {
  /// Mendapatkan daftar dosen
  Future<List<DosenModel>> getDosenList() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users'),
      headers: {'Accept': 'application/json'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      print(data); // Debug: Tampilkan data yang sudah di-decode
      return data.map((json) => DosenModel.fromJson(json)).toList();
    } else {
      print('Error: ${response.statusCode} - ${response.body}');
      throw Exception('Gagal memuat data dosen: ${response.statusCode}');
    }
  }
}


// Versi Dio
class DosenRepository {
  final Dio _dio = Dio();

  /// Mendapatkan daftar dosen menggunakan Dio
  Future<List<DosenModel>> getDosenList() async {
    final response = await _dio.get(
      'https://jsonplaceholder.typicode.com/users',
      options: Options(headers: {'Accept': 'application/json'}),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;
      print(data); // Debug
      return data.map((json) => DosenModel.fromJson(json)).toList();
    } else {
      throw Exception('Gagal memuat data dosen: ${response.statusCode}');
    }
  }
}