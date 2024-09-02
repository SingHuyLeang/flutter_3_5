import 'package:flutter/material.dart';
import 'package:shoes_app/data/product.dart';
import 'package:shoes_app/ui/components/widgets/text.dart';
import 'package:shoes_app/ui/theme/colors.dart';
import 'package:shoes_app/ui/theme/type.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.product});

  final Product product;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int rating = 0;

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
                    widget.product.image,
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 4,
                        child: SText(
                          text: widget.product.name,
                          size: 24,
                          font: Font.bold,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Row(
                          children: List.generate(
                            5,
                            (index) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  rating = index + 1; // 3 point
                                });
                              },
                              child: Icon(
                                Icons.star,
                                color: rating > index
                                    ? SColors.primary
                                    : Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  SText(
                    text: "\$ ${widget.product.price}",
                    size: 20,
                    font: Font.bold,
                  ),
                  const SizedBox(height: 24),
                  SText(
                    text: widget.product.description,
                    size: 16,
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SText(text: "Color", font: Font.bold, size: 20),
                              SizedBox(height: 16),
                              Row(
                                children: List.generate(
                                  widget.product.colors.length,
                                  (index) => GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        //
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CircleAvatar(
                                        radius: 16,
                                        backgroundColor:
                                            widget.product.colors[index],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: List.generate(
                            5,
                            (index) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  rating = index + 1; // 3 point
                                });
                              },
                              child: Icon(
                                Icons.star,
                                color: rating > index
                                    ? SColors.primary
                                    : Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
