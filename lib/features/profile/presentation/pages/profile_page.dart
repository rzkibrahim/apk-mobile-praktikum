import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modul_2/core/widgets/common_widgets.dart';
import 'package:modul_2/features/profile/presentation/providers/profile_providers.dart';
import 'package:modul_2/features/profile/presentation/widgets/profile_widgets.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileState = ref.watch(profileNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () {
              ref.invalidate(profileNotifierProvider);
            },
            tooltip: 'Refresh',
          ), // IconButton
        ],
      ), // AppBar
      body: profileState.when(
        // State: Loading
        loading: () => const LoadingWidget(),

        // State: Error
        error: (error, stack) => CustomErrorWidget(
          message: 'Gagal memuat data profile: ${error.toString()}',
          onRetry: () {
            ref.read(profileNotifierProvider.notifier).refresh();
          },
        ), // CustomErrorWidget

        // State: data profile berhasil dimuat
        data: (profile) {
          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(profileNotifierProvider);
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),

                    // Avatar
                    CircleAvatar(
                      radius: 50,
                      child: Text(
                        profile.nama.substring(0, 1).toUpperCase(),
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Nama
                    Text(
                      profile.nama,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Email
                    Text(
                      profile.email,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Info Cards
                    Card(
                      child: ListTile(
                        leading: const Icon(Icons.badge_outlined),
                        title: const Text('NIM'),
                        subtitle: Text(profile.nim),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        leading: const Icon(Icons.school),
                        title: const Text('Program Studi'),
                        subtitle: Text(profile.jurusan),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        leading: const Icon(Icons.calendar_today_outlined),
                        title: const Text('Angkatan'),
                        subtitle: Text(profile.angkatan),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        leading: const Icon(Icons.phone_outlined),
                        title: const Text('No. HP'),
                        subtitle: Text(profile.noHp),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        leading: const Icon(Icons.location_on_outlined),
                        title: const Text('Alamat'),
                        subtitle: Text(profile.alamat),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        leading: const Icon(Icons.info_outlined),
                        title: const Text('Versi Aplikasi'),
                        subtitle: const Text('1.0.0'),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ), // Column
              ), // Padding
            ), // SingleChildScrollView
          ); // RefreshIndicator
        },
      ),
    ); // Scaffold
  }
}