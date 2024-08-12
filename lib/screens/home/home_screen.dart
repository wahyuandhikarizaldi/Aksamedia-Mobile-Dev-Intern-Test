// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../models/product.dart';
import '../detail/details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final CarouselController _carouselController = CarouselController();
  final List<String> images = [
    'assets/images/landing1.png',
    'assets/images/landing2.png',
    'assets/images/landing3.png',
  ];

  final List<String> titles = [
    '''Gratis Materi Belajar
Menjadi Seller Handal''',
    '''Ribuan Produk
dengan Kualitas Terbaik''',
    '''Toko Online Unik
Untuk Kamu Jualan''',
  ];

  final List<String> descriptions = [
    '''Nggak bisa jualan?
Jangan khawatir, Tokorame akan membimbing kamu hingga menjadi seller langsung dari ahlinya''',
    '''Tokorame menyediakan ribuan produk dengan kualitas derbaik dari seller terpercaya''',
    '''Subdomain unik dan toko online profesional
siap pakai''',
  ];

  void _next() {
    if (_currentIndex == images.length - 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailsScreen(
            product: products[0],
          ),
        ),
      );
    } else {
      setState(() {
        _currentIndex += 1;
      });
      _carouselController.animateToPage(_currentIndex);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            pinned: true,
            expandedHeight: size.height * 0.6,
            flexibleSpace: Stack(
              children: [
                FlexibleSpaceBar(
                  background: CarouselSlider(
                    carouselController: _carouselController,
                    options: CarouselOptions(
                      height: size.height,
                      viewportFraction: 1.0,
                      enlargeCenterPage: false,
                      autoPlay: false,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                    items: images.map((image) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: size.width,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(image),
                                fit: BoxFit.fill,
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < images.length; i++)
                        Container(
                          width: 8.0,
                          height: 8.0,
                          margin: const EdgeInsets.symmetric(horizontal: 4.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                _currentIndex == i ? Colors.white : Colors.grey,
                          ),
                        ),
                    ],
                  ),
                ),
                Positioned(
                  top: 40,
                  right: 20,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                            product: products[0],
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      "Lewati",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          titles[_currentIndex],
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          descriptions[_currentIndex],
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 30),
                        GestureDetector(
                          onTap: _next,
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              _currentIndex == images.length - 1
                                  ? "Mulai"
                                  : "Selanjutnya",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
