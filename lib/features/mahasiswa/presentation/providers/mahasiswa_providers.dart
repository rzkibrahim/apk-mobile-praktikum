import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modul_2/features/mahasiswa/data/models/mahasiswa_model.dart';
import 'package:modul_2/features/mahasiswa/data/repositories/mahasiswa_repositories.dart';
import 'package:modul_2/core/services/local_storage_service.dart';
import 'package:modul_2/core/network/dio_client.dart';

// Repository Provider
// Tambahkan provider ini di paling atas atau dekat repository provider
final dioClientProvider = Provider<DioClient>((ref) {
  return DioClient();
});

// Perbaiki bagian ini
final mahasiswaRepositoryProvider = Provider<MahasiswaRepository>((ref) {
  // AMBIL dioClient, BUKAN storage
  final dio = ref.watch(dioClientProvider); 
  return MahasiswaRepository(dio);
});// Provider

// LocalStorageService Provider (reuse dari dosen jika sudah ada)
final mahasiswaLocalStorageProvider = Provider<LocalStorageService>((ref) {
  return LocalStorageService();
}); // Provider

// — Provider semua mahasiswa yang disimpan ——————————————
final savedMahasiswaProvider =
    FutureProvider<List<Map<String, String>>>((ref) async {
  final storage = ref.watch(mahasiswaLocalStorageProvider);
  return storage.getSavedMahasiswa();
});

// StateNotifier untuk mengelola state mahasiswa
class MahasiswaNotifier
    extends StateNotifier<AsyncValue<List<MahasiswaModel>>> {
  final MahasiswaRepository _repository;
  final LocalStorageService _storage;

  MahasiswaNotifier(this._repository, this._storage)
      : super(const AsyncValue.loading()) {
    loadMahasiswaList();
  }

  Future<void> loadMahasiswaList() async {
    state = const AsyncValue.loading();
    try {
      final data = await _repository.getMahasiswaList();
      state = AsyncValue.data(data);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> refresh() async {
    await loadMahasiswaList();
  }

  /// Simpan mahasiswa yang dipilih ke local storage
  Future<void> saveSelectedMahasiswa(MahasiswaModel mahasiswa) async {
    await _storage.addMahasiswaToSavedList(
      mahasiswaId: mahasiswa.id.toString(),
      name: mahasiswa.name,
      email: mahasiswa.email,
    );
  }

  /// Hapus mahasiswa tertentu dari list
  Future<void> removeSavedMahasiswa(String mahasiswaId) async {
    await _storage.removeSavedMahasiswa(mahasiswaId);
  }

  /// Hapus semua mahasiswa dari list
  Future<void> clearSavedMahasiswa() async {
    await _storage.clearSavedMahasiswa();
  }
}

// Mahasiswa Notifier Provider
final mahasiswaNotifierProvider = StateNotifierProvider.autoDispose<
    MahasiswaNotifier,
    AsyncValue<List<MahasiswaModel>>>((ref) {
  final repository = ref.watch(mahasiswaRepositoryProvider);
  final storage = ref.watch(mahasiswaLocalStorageProvider);
  return MahasiswaNotifier(repository, storage);
});