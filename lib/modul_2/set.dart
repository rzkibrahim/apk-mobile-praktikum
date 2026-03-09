import 'dart:io';

void main() {
    Set<String> burung = {'Merpati', 'Elang', 'Kakatua'};
    print('Data Burung: $burung');

    // Tambah data
    stdout.write('Masukkan burung yang ingin ditambahkan: ');
    String tambah = stdin.readLineSync()!;
    if (burung.add(tambah)) {
        print("Data '$tambah' berhasil ditambahkan.");
    } else {
        print("Data '$tambah' sudah ada (duplikat diabaikan).");
    }
    print("Data setelah ditambah: $burung");

    // Tambah data duplikat (otomatis dicoba dengan data yang sama)
        stdout.write('Masukkan data duplikat untuk dicoba: ');
    String duplikat = stdin.readLineSync()!;
    if (burung.add(duplikat)) {
        print("Data '$duplikat' berhasil ditambahkan.");
    } else {
        print("Data '$duplikat' sudah ada di Set. Tidak ditambahkan (duplikat).");
    }
    print("Data setelah percobaan duplikat: $burung");

    // Hapus data
    stdout.write('Masukkan burung yang ingin dihapus: ');
    String hapus = stdin.readLineSync()!;
    if (burung.remove(hapus)) {
        print("Data '$hapus' berhasil dihapus.");
    } else {
        print("Data '$hapus' tidak ditemukan.");
    }

    // Cek data tertentu
    stdout.write('Masukkan burung yang ingin dicek: ');
    String cek = stdin.readLineSync()!;
    if (burung.contains(cek)) {
        print("Data '$cek' ADA di dalam Set.");
    } else {
        print("Data '$cek' TIDAK ADA di dalam Set.");
    }

    // Hitung jumlah data
    print('Total data sekarang: ${burung.length}');

    // Tampilkan semua data
    print('\nData burung saat ini adalah:');
    int no = 1;
    for (String b in burung) {
        print("$no. $b");
        no++;
    }
    }