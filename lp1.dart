import 'dart:async';

// Kelas yang mewakili item-menu
class ItemMenu {
  final String nama;
  final double harga;

  ItemMenu(this.nama, this.harga);
}

// Kelas yang mewakili pesanan pelanggan
class Pesanan {
  final ItemMenu item;
  final int jumlah;

  Pesanan(this.item, this.jumlah);
}

// Kelas yang mewakili pelanggan
class Pelanggan {
  final int id;
  final String nama;
  final List<Pesanan> pesanan;

  Pelanggan(this.id, this.nama) : pesanan = [];

  // Metode untuk menambahkan pesanan
  void tambahPesanan(ItemMenu item, int jumlah) {
    pesanan.add(Pesanan(item, jumlah));
  }
}

// Kelas yang mewakili restoran fiktif
class Restoran {
  final String nama;
  final List<ItemMenu> menu;
  final List<Pelanggan> pelanggan;

  Restoran(this.nama, this.menu) : pelanggan = [];

  // Metode untuk mensimulasikan pemrosesan pesanan secara asynchronous
  Future<void> prosesPesanan(Pelanggan pelanggan) async {
    // Simulasi waktu pemrosesan
    await Future.delayed(Duration(seconds: 1));
    print('${pelanggan.nama} (ID: ${pelanggan.id}) telah memesan:');
    for (var pesanan in pelanggan.pesanan) {
      print('${pesanan.jumlah}x ${pesanan.item.nama}');
    }
    print('Memproses pesanan...');
    await Future.delayed(Duration(seconds: 2));
    print('Pesanan diproses untuk ${pelanggan.nama} (ID: ${pelanggan.id}).');
  }

  // Metode untuk menampilkan menu
  void tampilkanMenu() {
    print('Menu:');
    for (var item in menu) {
      print('${item.nama} - Rp${item.harga.toStringAsFixed(2)}');
    }
  }

  // Metode untuk menampilkan daftar pelanggan
  void tampilkanPelanggan() {
    print('Pelanggan:');
    for (var pelanggan in pelanggan) {
      print('ID: ${pelanggan.id}, Nama: ${pelanggan.nama}');
    }
  }
}

void main() {
  // Membuat restoran dengan menu
  Restoran restoran = Restoran(
    'RestoranKu',
    [
      ItemMenu('Pizza', 50000),
      ItemMenu('Burger', 25000),
      ItemMenu('Salad', 23000),
    ],
  );

  // Membuat pelanggan
  Pelanggan pelanggan1 = Pelanggan(1, 'Alice');
  Pelanggan pelanggan2 = Pelanggan(2, 'Bob');

  // Menambahkan pelanggan ke restoran
  restoran.pelanggan.addAll([pelanggan1, pelanggan2]);

  // Menambahkan pesanan untuk pelanggan
  pelanggan1.tambahPesanan(restoran.menu[0], 2); // Alice memesan 2x Pizza
  pelanggan1.tambahPesanan(restoran.menu[2], 1); // Alice memesan 1x Salad
  pelanggan2.tambahPesanan(restoran.menu[1], 3); // Bob memesan 3x Burger

  // Menampilkan menu dan pelanggan
  restoran.tampilkanMenu();
  restoran.tampilkanPelanggan();

  // Memproses pesanan secara asynchronous
  prosesPesanan(restoran);
}

// Fungsi asynchronous untuk memproses pesanan
Future<void> prosesPesanan(Restoran restoran) async {
  for (var pelanggan in restoran.pelanggan) {
    try {
      await restoran.prosesPesanan(pelanggan);
    } catch (e) {
      print('Error saat memproses pesanan untuk ${pelanggan.nama} (ID: ${pelanggan.id}): $e');
    }
  }
}
