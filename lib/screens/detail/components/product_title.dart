import 'package:flutter/material.dart';

import '../../../models/product.dart';

class ProductTitle extends StatelessWidget {
  const ProductTitle({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          product.title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        Text(
          product.shop,
          style: const TextStyle(color: Colors.black54),
        ),
        const SizedBox(height: 20),
        Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    product.customerprice,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "Harga Customer",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 50,
              child: VerticalDivider(
                color: Colors.black,
                thickness: 1.5,
              ),
            ),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    product.resellerprice,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "Harga Reseller",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.yellow[500], 
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          child: Center(
            child: RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.black,
                    ),
                children: [
                  const TextSpan(
                    text: "Komisi ",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  TextSpan(
                    text: "${product.komisi} ",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: "(${product.persen}%)",
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
