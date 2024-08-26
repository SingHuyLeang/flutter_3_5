import 'package:flutter/material.dart';

import '../../components/widgets/text.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      child: const SText(
        text: "Page Cart",
        size: 30,
      ),
    );
  }
}
