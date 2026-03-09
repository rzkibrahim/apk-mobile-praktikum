import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modul_2/core/widgets/common_widgets.dart';
import 'package:modul_2/features/mahasiswa_aktif/presentation/providers/mahasiswa_aktif_providers.dart';
import 'package:modul_2/features/mahasiswa/presentation/widgets/mahasiswa_widgets.dart';

class MahasiswaAktifPage extends ConsumerWidget {
  const MahasiswaAktifPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mahasiswaAktifState = ref.watch(mahasiswaAktifNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mahasiswa Aktif'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () {
              ref.invalidate(mahasiswaAktifNotifierProvider);
            },
            tooltip: 'Refresh',
          ), // IconButton
        ],
      ), // AppBar
      body: mahasiswaAktifState.when(
        // State: Loading
        loading: () => const LoadingWidget(),

        // State: Error
        error: (error, stack) => CustomErrorWidget(
          message: 'Gagal memuat data mahasiswa aktif: ${error.toString()}',
          onRetry: () {
            ref.read(mahasiswaAktifNotifierProvider.notifier).refresh();
          },
        ), // CustomErrorWidget

        // State: data mahasiswa aktif berhasil dimuat
        data: (mahasiswaList) {
          return MahasiswaListView(
            mahasiswaList: mahasiswaList,
            onRefresh: () async {
              ref.invalidate(mahasiswaAktifNotifierProvider);
            },
            useModernCard: true,
          ); // MahasiswaListView
        },
      ),
    ); // Scaffold
  }
}