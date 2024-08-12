// ignore_for_file: library_private_types_in_public_api, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../models/product.dart';

class Description extends StatefulWidget {
  const Description({super.key, required this.product});

  final Product product;

  @override
  _DescriptionState createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    const TextStyle textStyle = TextStyle(height: 1.5);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Deskripsi",
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16, color: Colors.black),
              ),
              GestureDetector(
                onTap: () {
                  Clipboard.setData(
                      ClipboardData(text: widget.product.description));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Description copied to clipboard!"),
                    ),
                  );
                },
                child: SvgPicture.asset(
                  "assets/icons/copy.svg",
                  height: 24,
                  width: 24,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          _isExpanded
              ? Text(
                  widget.product.description,
                  style: textStyle,
                )
              : Text(
                  widget.product.description,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: textStyle,
                ),
          const SizedBox(height: 8),
          Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    _isExpanded ? "Sembunyikan" : "Selengkapnya",
                    style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    _isExpanded ? Icons.expand_less : Icons.expand_more,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
