import 'package:flutter/material.dart';

import '../../components/widgets/text.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      child: const SText(
        text: "Page Favorite",
        size: 30,
      ),
    );
  }
}
