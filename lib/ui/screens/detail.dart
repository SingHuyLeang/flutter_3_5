import 'package:flutter/material.dart';
import 'package:shoes_app/data/product.dart';
import 'package:shoes_app/ui/components/widgets/text.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
         title: SText(text: product.name),
      ),
      body: Center(
        child: Image.asset(product.image),
      ),
    );
  }
}