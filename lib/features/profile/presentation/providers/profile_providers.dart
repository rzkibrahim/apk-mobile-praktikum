import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modul_2/features/profile/data/models/profile_model.dart';
import 'package:modul_2/features/profile/data/repositories/profile_repositories.dart';

// Repository Provider
final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  return ProfileRepository();
}); // Provider

// StateNotifier untuk mengelola state profile
class ProfileNotifier extends StateNotifier<AsyncValue<ProfileModel>> {
  final ProfileRepository _repository;

  ProfileNotifier(this._repository) : super(const AsyncValue.loading()) {
    loadProfile();
  }

  /// Load data profile
  Future<void> loadProfile() async {
    state = const AsyncValue.loading();
    try {
      final data = await _repository.getProfile();
      state = AsyncValue.data(data);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  /// Refresh data profile
  Future<void> refresh() async {
    await loadProfile();
  }

  /// Update profile
  Future<void> updateProfile(ProfileModel profile) async {
    state = const AsyncValue.loading();
    try {
      final updated = await _repository.updateProfile(profile);
      state = AsyncValue.data(updated);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}

// Profile Notifier Provider
final profileNotifierProvider = StateNotifierProvider.autoDispose<
    ProfileNotifier,
    AsyncValue<ProfileModel>>((ref) {
  final repository = ref.watch(profileRepositoryProvider);
  return ProfileNotifier(repository);
});