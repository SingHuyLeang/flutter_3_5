import 'package:flutter/material.dart';
import 'package:shoes_app/data/product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.blue,
      child: Image.asset(product.image),
    );
  }
}
