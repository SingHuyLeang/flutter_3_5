import 'package:flutter/material.dart';
import 'package:pet_app/utils/types/colors.dart';
import 'package:pet_app/utils/types/fonts.dart';

class PText extends StatelessWidget {
  const PText({
    super.key,
    required this.text,
    this.fontType = Font.medium,
    this.color,
    this.size = 14,
    this.weight,
    this.line,
    this.overflow,
  });
  final String text;
  final String fontType;
  final Color? color;
  final double size;
  final FontWeight? weight;
  final int? line;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontFamily: fontType,
        color: color ?? PColors.dark,
        fontWeight: weight,
      ),
      maxLines: line,
      softWrap: true,
      overflow: overflow,
    );
  }
}
