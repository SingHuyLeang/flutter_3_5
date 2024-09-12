import 'package:flutter/material.dart';
import 'package:pet_app/utils/types/colors.dart';
import 'package:pet_app/utils/types/fonts.dart';

class PText extends StatelessWidget {
  const PText({
    super.key,
    required this.text,
    this.isBold = false,
    this.color,
    this.size = 16,
  });
  final String text;
  final bool isBold;
  final Color? color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontFamily: isBold ? Font.siembold : Font.medium,
        color: color ?? PColors.dark,
      ),
      maxLines: null,
      softWrap: true,
    );
  }
}
