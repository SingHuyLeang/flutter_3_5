import 'package:flutter/material.dart';
import 'package:shoes_app/ui/theme/colors.dart';
import 'package:shoes_app/ui/theme/type.dart';

class SText extends StatelessWidget {
  const SText({
    super.key,
    required this.text,
    this.font = Font.regular,
    this.size = 16,
    this.space,
    this.color = SColors.dark,
  });

  final String text;
  final String font;
  final double size;
  final double? space;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontFamily: font,
        letterSpacing: space,
        decoration: TextDecoration.none,
      ),
    );
  }
}
