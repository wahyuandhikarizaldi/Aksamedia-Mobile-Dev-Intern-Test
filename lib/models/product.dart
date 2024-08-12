// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Product {
  final String image,
      title,
      shop,
      description,
      customerprice,
      resellerprice,
      komisi;
  final List<String> size, images;
  final int persen, stok, id;
  final List<Color> colors;
  final bool isNew;

  Product({
    required this.image,
    required this.title,
    required this.shop,
    required this.description,
    required this.customerprice,
    required this.resellerprice,
    required this.komisi,
    required this.persen,
    required this.stok,
    required this.size,
    required this.images,
    required this.id,
    required this.colors,
    this.isNew = false,
  });
}

List<Product> products = [
  Product(
      id: 1,
      title: "Beauty Set by Irvie",
      shop: "Irvie group official",
      customerprice: "Rp178.000",
      resellerprice: "Rp142.400",
      komisi: "Rp35.600",
      persen: 20,
      size: ["Paket 1", "Paket 2"],
      stok: 120,
      description: dummyText,
      image: "assets/images/product1.png",
      images: ["assets/images/product1.png", "assets/images/product1.png"],
      colors: [
        const Color.fromARGB(255, 245, 186, 132),
        const Color.fromARGB(253, 63, 33, 19),
      ],
      isNew: true),
  Product(
      id: 2,
      title: "Beauty Set by Irvie",
      shop: "Irvie group official",
      customerprice: "Rp178.000",
      resellerprice: "Rp142.400",
      komisi: "Rp35.600",
      persen: 20,
      size: ["Paket 1", "Paket 2"],
      stok: 15,
      description: dummyText,
      image: "assets/images/product1.png",
      images: ["assets/images/product1.png", "assets/images/product1.png"],
      colors: [
        const Color.fromARGB(255, 0, 145, 255),
        const Color.fromARGB(255, 255, 145, 0),
        const Color.fromARGB(255, 255, 0, 0),
      ]),
  Product(
      id: 3,
      title: "Beauty Set by Irvie",
      shop: "Irvie group official",
      customerprice: "Rp178.000",
      resellerprice: "Rp142.400",
      komisi: "Rp35.600",
      persen: 20,
      size: ["Paket 1", "Paket 2"],
      stok: 202,
      description: dummyText,
      image: "assets/images/product1.png",
      images: ["assets/images/product1.png", "assets/images/product1.png"],
      colors: [
        const Color.fromARGB(255, 123, 255, 0),
        const Color.fromARGB(255, 255, 0, 0),
        const Color.fromARGB(255, 255, 217, 0),
      ]),
  Product(
      id: 4,
      title: "Beauty Set by Irvie",
      shop: "Irvie group official",
      customerprice: "Rp178.000",
      resellerprice: "Rp142.400",
      komisi: "Rp35.600",
      persen: 20,
      size: ["Paket 1", "Paket 2"],
      stok: 12,
      description: dummyText,
      image: "assets/images/product1.png",
      images: ["assets/images/product1.png", "assets/images/product1.png"],
      colors: [
        const Color.fromARGB(255, 0, 255, 42),
        const Color.fromARGB(255, 38, 0, 255),
        const Color.fromARGB(255, 0, 162, 255),
      ]),
];

String dummyText = """
*New Material*
Terbuat dari 100% Katun Linen yang membuat nyaman jika digunakan.
Menggunakan fit Relaxed Fit.

SIZE CHART RELAXED SHIRT:
Lebar Dada | Panjang Baju | Panjang Lengan
S : 58cm | 68cm | 24cm
M : 60cm | 70cm | 25cm
L : 62cm | 72cm | 26cm
XL : 64cm | 74cm | 27cm
XXL : 66cm | 76cm | 28cm
*toleransi perbedaan ukuran 1-3cm
*panjang baju diukur dari ujung kerah, bukan dari bahu/pundak

• Tinggi Badan dan Berat Badan tidak selalu bisa menjadi patokan untuk memilih ukuran, jadi kita sarankan untuk disesuaikan dari Lebar Dada dengan detail ukuran yang sudah tertera diatas.

Few quick notes:
• Warna pada gambar dapat sedikit berbeda dengan warna asli produk akibat pencahayaan saat proses photoshoot.
• Barang yang dikirim sesuai dengan variasi yang telah dipilih pada saat checkout, bukan melalui catatan pesan atau chat.
• Mohon pastikan alamat pengiriman dan data diri sudah sesuai untuk menghindari kendala pada saat proses pengiriman.

INFORMASI PENGIRIMAN
• Pengiriman dari Bandung.
• Pemesanan sebelum pukul 15.00 WIB akan dikirim di hari yang sama.
• Pengiriman Senin-Sabtu, tidak ada pengiriman pada hari Minggu/Hari Libur.

S&K PENGEMBALIAN/RETUR
• Batas pengembalian barang 3x24 jam setelah paket diterima.
• Chat admin terlebih dahulu sebelum memberikan rating bintang apabila ada masalah pada paket yang diterima.
• Sertakan video unboxing untuk klaim komplain, apabila tidak menyertakan video saat komplain mohon maaf kami tidak dapat memproses komplain tersebut.
• Tidak menerima pengembalian/retur dikarenakan kesalahan pembeli dalam memilih ukuran.

CHECKOUT = SETUJU DENGAN SEMUA KETENTUAN DIATAS 
""";
