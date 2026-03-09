import 'dart:io';

void main() {
    List<String> names = ['Alice', 'Bob', 'Charlie'];
    print('Names: $names');

    // Menambah data dalam list
    names.add('David');
    print('Names telah ditambahkan: $names');

    // Mengambil data index tertentu
    print('Elemen Pertama: ${names[0]}');
    print('Elemen Kedua: ${names[1]}');

    // Mengubah data pada index tertentu
    names[1] = 'Bobby';
    print('Names setelah diubah: $names');

    // Menghapus data dari list
    names.remove('Charlie');
    print('Names setelah dihapus: $names');

    // Menghitung jumlah data dalam list
    print('Jumlah data dalam list: ${names.length}');

    // Loping data list
    print('Looping data dalam list:');
    for (String name in names) {
        print(name);
}

// Membuat list kosong
List<String> dataList = [];
print('Data List kosong: $dataList');

// Mengambil jumlah data dari pengguna
int count = 0;
while (count <= 0) {
    stdout.write('Masukkan jumlah list: ');
    String? input = stdin.readLineSync();
    try {
        count = int.parse(input!);
        if (count <= 0) {
            print('Jumlah harus lebih dari 0. Silakan coba lagi.');
        }
    } catch (e) {
        print('Input tidak valid. Silakan masukkan angka.');
    }
}

// Memasukkan data ke dalam list menggunakan for loop
for (int i = 0; i < count; i++) {
    stdout.write('Masukkan data ke-${i + 1}: ');
    String x = stdin.readLineSync()!;
    dataList.add(x);
}

// Menampilkan Data list
print('Data List: $dataList');

// TAMPILKAN DATA BERDASARKAN INDEX TERTENTU
stdout.write('Masukkan index yang ingin ditampilkan: ');
int indexTampil = int.parse(stdin.readLineSync()!);
if (indexTampil >= 0 && indexTampil < dataList.length) {
    print('Data pada index $indexTampil: ${dataList[indexTampil]}');
} else {
    print ('Index tidak valid. Silakan masukkan angka antara 0 dan ${dataList.length - 1}.');
}

//  UBAH BERDASARKAN INDEX TERTENTU
stdout.write('Masukkan index yang ingin diubah: ');
int indexUbah = int.parse(stdin.readLineSync()!);
if (indexUbah >= 0 && indexUbah < dataList.length) {
    stdout.write('Masukkan data baru: ');
    String dataBaru = stdin.readLineSync()!;
    dataList[indexUbah] = dataBaru;
    print('Data list setelah diubah: $dataList');
} else {
    print ('Index tidak valid. Silakan masukkan angka antara 0 dan ${dataList.length - 1}.');
}

// HAPUS BERDASARKAN INDEX TERTENTU
stdout.write('Masukkan index yang ingin dihapus: ');
int indexHapus = int.parse(stdin.readLineSync()!);
if (indexHapus >= 0 && indexHapus < dataList.length) {
    dataList.removeAt(indexHapus);
    print('Data list setelah dihapus: $dataList');
} else {
    print ('Index tidak valid. Silakan masukkan angka antara 0 dan ${dataList.length - 1}.');
}

// TAMPILKAN HASIL AKHIR
print('\n=== SEMUA DATA ===');
for (int i = 0; i < dataList.length; i++) {
    print('Index $i: ${dataList[i]}');
}
}