# Implementasi OOP dan Asynchronous dalam Program Dart

## 1. Object-Oriented Programming (OOP)

- Dalam program ini, konsep OOP digunakan untuk memodelkan entitas-entitas seperti restoran, menu, dan pelanggan.
- Terdapat beberapa kelas yang merepresentasikan konsep OOP:
  - `ItemMenu`: Mewakili item-menu dengan atribut nama dan harga.
  - `Pelanggan`: Mewakili pelanggan dengan atribut nama dan id. Pelanggan juga memiliki daftar pesanan.
  - `Restoran`: Mewakili restoran dengan atribut nama, daftar menu, dan daftar pelanggan. Restoran juga memiliki metode untuk memproses pesanan.

## 2. Asynchronous Operations

- Program ini menggunakan konsep asynchronous untuk mensimulasikan proses yang memakan waktu seperti pemrosesan pesanan.
- Fungsi `prosesPesanan` dalam kelas `Restoran` dijalankan secara asynchronous menggunakan kata kunci `async` dan `await`.
- Penggunaan asynchronous memungkinkan program untuk melakukan tugas-tugas lain tanpa harus menunggu pemrosesan pesanan selesai.

## Penggunaan Program

1. Program ini mensimulasikan sebuah restoran dengan daftar menu dan pelanggan.
2. Setiap pelanggan bisa memesan satu atau lebih item dari menu.
3. Pesanan diproses secara asynchronous, sehingga program tidak terblokir saat pemrosesan pesanan berlangsung.
4. Hasil pemrosesan pesanan ditampilkan dalam output program.

## dokumentasi hasil program
![dok](<Screenshot 2024-03-14 160813.png>)