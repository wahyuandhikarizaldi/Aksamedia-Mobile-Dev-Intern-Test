// ignore_for_file: library_private_types_in_public_api, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../models/product.dart';
import 'components/add_to_cart.dart';
import 'components/color_and_size.dart';
import 'components/description.dart';
import 'components/product_title.dart';
import 'components/item_card.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.product});

  final Product product;

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int _currentIndex = 0; 

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: false, 
      backgroundColor: Colors.transparent, 
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Text(
                    'Bagikan Produk',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Teks dan Link',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
            const Divider(height: 40, thickness: 1),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Gambar',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
            const Divider(height: 40, thickness: 1),
          ],
        ),
      ),
    );
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
            expandedHeight: size.height * 0.5, 
            flexibleSpace: Stack(
              children: [
                FlexibleSpaceBar(
                  background: CarouselSlider(
                    options: CarouselOptions(
                      height: size.height * 0.6, 
                      viewportFraction: 1.0,
                      enlargeCenterPage: false,
                      autoPlay: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                    items: widget.product.images.map((imagePath) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: size.width,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(imagePath),
                                fit: BoxFit.cover,
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
                      for (int i = 0; i < 3; i++)
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
              ],
            ),
            leading: IconButton(
              icon: SvgPicture.asset('assets/icons/back.svg'),
              onPressed: () => Navigator.pop(context),
            ),
            actions: <Widget>[
              IconButton(
                icon: SvgPicture.asset("assets/icons/opsi.svg"),
                onPressed: () {
                },
              ),
              IconButton(
                icon: SvgPicture.asset("assets/icons/cart.svg"),
                onPressed: () {
                },
              ),
              const SizedBox(width: 10)
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      if (widget.product.isNew)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin:
                                  const EdgeInsets.only(top: 20, bottom: 10),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              decoration: BoxDecoration(
                                color: Colors.yellow[500], 
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: RichText(
                                text: TextSpan(
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        color: Colors.black, 
                                      ),
                                  children: const [
                                    TextSpan(
                                      text: "NEW ",
                                      style: TextStyle(
                                        fontWeight:
                                            FontWeight.bold, 
                                      ),
                                    ),
                                    TextSpan(
                                      text: "Product Baru",
                                      style: TextStyle(
                                        fontWeight:
                                            FontWeight.normal, 
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            IconButton(
                              icon: SvgPicture.asset(
                                "assets/icons/share.svg",
                                color:
                                    Colors.black,
                              ),
                              onPressed: _showBottomSheet,
                            ),
                          ],
                        )
                      else
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ProductTitle(
                                product: widget
                                    .product), 
                            IconButton(
                              icon: SvgPicture.asset(
                                "assets/icons/share.svg",
                                color:
                                    Colors.black, 
                              ),
                              onPressed: _showBottomSheet,
                            ),
                          ],
                        ),
                      ProductTitle(
                          product: widget
                              .product), 
                      const SizedBox(height: 20),
                      ColorAndSize(product: widget.product),
                      const SizedBox(height: 10),
                      Description(product: widget.product),
                      const SizedBox(height: 20),
                      const Text(
                        "Produk lain dari Irvie group official",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 18),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight:
                              size.height / 2,
                        ),
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 2,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20,
                            childAspectRatio: 0.58,
                          ),
                          itemBuilder: (context, index) => ItemCard(
                            product: products[index],
                            press: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailsScreen(
                                  product: products[index],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),

                      const Text(
                        "Produk Serupa",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 18),
                      ),

                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight:
                              size.height / 2,
                        ),
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 2,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20,
                            childAspectRatio: 0.6,
                          ),
                          itemBuilder: (context, index) => ItemCard(
                            product: products[index],
                            press: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailsScreen(
                                  product: products[index],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar:
          AddToCart(product: widget.product), 
    );
  }
}
