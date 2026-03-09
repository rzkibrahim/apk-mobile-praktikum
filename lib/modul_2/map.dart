import 'dart:io';

void main() {
    // Membuat Map dengan beberapa data awal
    Map<String, String> mahasiswa = {
        'NIM001': 'Alice',
        'NIM002': 'Bob',
        'NIM003': 'Charlie'
    };
    print('Data Mahasiswa: $mahasiswa');

    // Menambah data ke dalam Map
    mahasiswa['NIM004'] = 'David';
    print('Data Mahasiswa setelah ditambahkan: $mahasiswa');

    // Mengakses data berdasarkan key
    print('Nama mahasiswa dengan NIM001: ${mahasiswa['NIM001']}');

    // === UBAH DATA BERDASARKAN KEY ===
    stdout.write('Masukkan NIM yang ingin diubah: ');
    String keyUbah = stdin.readLineSync()!;
    if (mahasiswa.containsKey(keyUbah)) {
        stdout.write('Masukkan nama baru: ');
        String namaBaru = stdin.readLineSync()!;
        mahasiswa[keyUbah] = namaBaru;
        print('Data "$keyUbah" berhasil diubah menjadi "$namaBaru".');
    } else {
        print('NIM "$keyUbah" tidak ditemukan.');
    }

    // === HAPUS DATA BERDASARKAN KEY ===
    stdout.write('Masukkan NIM yang ingin dihapus: ');
    String keyHapus = stdin.readLineSync()!;
    if (mahasiswa.remove(keyHapus) != null) {
        print('Data "$keyHapus" berhasil dihapus.');
    } else {
        print('NIM "$keyHapus" tidak ditemukan.');
    }

    // === CEK DATA BERDASARKAN KEY ===
    stdout.write('Masukkan NIM yang ingin dicek: ');
    String keyCek = stdin.readLineSync()!;
    if (mahasiswa.containsKey(keyCek)) {
        print('NIM "$keyCek" ADA di dalam Map.');
    } else {
        print('NIM "$keyCek" TIDAK ADA di dalam Map.');
    }

    // === TAMPILKAN HASIL AKHIR ===
    print('\n=== SEMUA DATA MAHASISWA ===');
    print('Jumlah data: ${mahasiswa.length}');
    print('Semua Key: ${mahasiswa.keys.toList()}');
    print('Semua Value: ${mahasiswa.values.toList()}');
    print('\nDetail data:');
    mahasiswa.forEach((key, value) {
        print('$key: $value');
    });

    
    // =============================================
    // === INPUT SINGLE (soal f) ===
    // =============================================
    print('\n=== INPUT DATA MAHASISWA ===');
    Map<String, dynamic> mhs = {};

    stdout.write('Masukkan NIM: ');
    String nim = stdin.readLineSync()!;
    stdout.write('Masukkan Nama: ');
    String nama = stdin.readLineSync()!;
    stdout.write('Masukkan Jurusan: ');
    String jurusan = stdin.readLineSync()!;
    stdout.write('Masukkan IPK: ');
    double ipk = double.parse(stdin.readLineSync()!);

    mhs = {'nim': nim, 'nama': nama, 'jurusan': jurusan, 'ipk': ipk};
    print('\nData Mahasiswa: $mhs');

    // =============================================
    // === INPUT MULTIPLE (soal f) ===
    // =============================================
    print('\n=== INPUT MULTIPLE MAHASISWA ===');
    stdout.write('Masukkan jumlah mahasiswa: ');
    int jumlah = int.parse(stdin.readLineSync()!);

    List<Map<String, dynamic>> listMhs = [];

    for (int i = 0; i < jumlah; i++) {
        print('\n---- Mahasiswa ke-${i + 1} ----');
        stdout.write('Masukkan NIM: ');
        String mNim = stdin.readLineSync()!;
        stdout.write('Masukkan Nama: ');
        String mNama = stdin.readLineSync()!;
        stdout.write('Masukkan Jurusan: ');
        String mJurusan = stdin.readLineSync()!;
        stdout.write('Masukkan IPK: ');
        double mIpk = double.parse(stdin.readLineSync()!);

        listMhs.add({
        'nim': mNim,
        'nama': mNama,
        'jurusan': mJurusan,
        'ipk': mIpk,
        });
    }

    // Tampilkan semua data multiple
    print('\n=== SEMUA DATA MAHASISWA ===');
    for (int i = 0; i < listMhs.length; i++) {
        print('Mahasiswa ke-${i + 1}: ${listMhs[i]}');
    }
    }
