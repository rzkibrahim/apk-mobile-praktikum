import 'package:modul_2/features/profile/data/models/profile_model.dart';

class ProfileRepository {
  /// Mendapatkan data profile pengguna yang sedang login
  Future<ProfileModel> getProfile() async {
    // Simulasi network delay
    await Future.delayed(const Duration(seconds: 1));

    // Data dummy profile
    return ProfileModel(
      nama: 'Admin D4TI',
      nim: '2021000',
      email: 'admin.d4ti@example.com',
      jurusan: 'Teknik Informatika',
      angkatan: '2021',
      noHp: '081234567890',
      alamat: 'Surabaya, Jawa Timur',
    );
  }

  /// Update profile pengguna
  Future<ProfileModel> updateProfile(ProfileModel profile) async {
    await Future.delayed(const Duration(seconds: 1));
    return profile;
  }
}