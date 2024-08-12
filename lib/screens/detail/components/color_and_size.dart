// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../../../models/product.dart';

class ColorAndSize extends StatefulWidget {
  const ColorAndSize({super.key, required this.product});

  final Product product;

  @override
  _ColorAndSizeState createState() => _ColorAndSizeState();
}

class _ColorAndSizeState extends State<ColorAndSize> {
  String? _selectedSize;
  Color? _selectedColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text("Ukuran", style: TextStyle(color: Colors.black)),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8.0,
                runSpacing: 4.0,
                children: widget.product.size.map((size) {
                  return ChoiceChip(
                    label: Text(size),
                    selected: _selectedSize == size,
                    onSelected: (selected) {
                      setState(() {
                        _selectedSize = selected ? size : null;
                      });
                    },
                    backgroundColor: Colors.grey[300],
                    selectedColor: Colors.grey[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: BorderSide(
                        color: _selectedSize == size
                            ? Colors.black
                            : Colors.transparent,
                        width: _selectedSize == size ? 2.5 : 1.0,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text("Warna", style: TextStyle(color: Colors.black)),
              Row(
                children: <Widget>[
                  for (Color color in widget.product.colors)
                    ColorDot(
                      color: color,
                      isSelected: _selectedColor == color,
                      onTap: () {
                        setState(() {
                          _selectedColor = color;
                        });
                      },
                    ),
                ],
              )
            ],
          ),
          const SizedBox(height: 16),
          RichText(
            text: TextSpan(
              children: [
                const TextSpan(
                  text: 'Stok: ',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text:
                      '${widget.product.stok > 100 ? '99+' : widget.product.stok} pcs',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ColorDot extends StatelessWidget {
  const ColorDot(
      {super.key,
      required this.color,
      required this.isSelected,
      required this.onTap});

  final Color color;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(
          top: 5,
          right: 10,
        ),
        height: 56,
        width: 56,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? Colors.black : Colors.transparent,
            width: isSelected ? 2.5 : 1.0,
          ),
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
