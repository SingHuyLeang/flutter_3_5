import 'package:flutter/material.dart';
import 'package:shoes_app/data/product.dart';
import 'package:shoes_app/ui/components/widgets/text.dart';
import 'package:shoes_app/ui/screens/detail.dart';
import 'package:shoes_app/ui/theme/colors.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key, required this.product});

  final Product product;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailScreen(
            product: widget.product,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Image.asset(widget.product.image,
                    fit: BoxFit.cover, height: 150),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SText(text: '\$ ${widget.product.price}'),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          widget.product.favorite = !widget.product.favorite;
                        });
                      },
                      icon: Icon(
                        widget.product.favorite
                            ? Icons.favorite
                            : Icons.favorite_outline,
                        color:
                            widget.product.favorite ? Colors.red : SColors.dark,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SText(text: widget.product.name),
        ],
      ),
    );
  }
}
