import 'package:flutter/material.dart';
import 'package:shoes_app/data/product.dart';
import 'package:shoes_app/ui/components/widgets/text.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 400,
              padding: const EdgeInsets.only(top: 24),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(26),
                  bottomRight: Radius.circular(26),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    product.image,
                  ),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: CircleAvatar(
                      backgroundColor: Colors.grey[300],
                      child: Icon(Icons.adaptive.arrow_back),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.shopping_cart),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
