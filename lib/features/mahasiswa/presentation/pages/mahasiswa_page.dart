import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modul_2/core/widgets/common_widgets.dart';
import 'package:modul_2/features/mahasiswa/presentation/providers/mahasiswa_providers.dart';
import 'package:modul_2/features/mahasiswa/presentation/widgets/mahasiswa_widgets.dart';

class MahasiswaPage extends ConsumerWidget {
  const MahasiswaPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mahasiswaState = ref.watch(mahasiswaNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Mahasiswa'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () {
              ref.invalidate(mahasiswaNotifierProvider);
            },
            tooltip: 'Refresh',
          ), // IconButton
        ],
      ), // AppBar
      body: mahasiswaState.when(
        // State: Loading
        loading: () => const LoadingWidget(),

        // State: Error
        error: (error, stack) => CustomErrorWidget(
          message: 'Gagal memuat data mahasiswa: ${error.toString()}',
          onRetry: () {
            ref.read(mahasiswaNotifierProvider.notifier).refresh();
          },
        ), // CustomErrorWidget

        // State: data mahasiswa berhasil dimuat
        data: (mahasiswaList) {
          return MahasiswaListView(
            mahasiswaList: mahasiswaList,
            onRefresh: () async {
              ref.invalidate(mahasiswaNotifierProvider);
            },
            useModernCard: true, // Set to false for simple card
          ); // MahasiswaListView
        },
      ),
    ); // Scaffold
  }
}