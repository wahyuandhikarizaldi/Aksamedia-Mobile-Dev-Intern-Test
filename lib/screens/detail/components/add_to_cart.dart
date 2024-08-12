import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../models/product.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({super.key, required this.product});

  final Product product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 20, horizontal: 20),
      child: Row(
        children: <Widget>[
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                side: const BorderSide(
                  color: Colors.black,
                ),
                backgroundColor: Colors.white,
              ),
              child: const Text(
                "Tambahkan ke toko",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            height: 50,
            width: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.black),
            child: IconButton(
              icon: SvgPicture.asset(
                "assets/icons/cart.svg",
                colorFilter:
                    const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
