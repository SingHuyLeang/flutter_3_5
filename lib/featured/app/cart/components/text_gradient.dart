import 'package:flutter/material.dart';
import 'package:pet_app/utils/theme/text_theme.dart';
import 'package:pet_app/utils/types/colors.dart';

Widget textGradient(String str1, String str2) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      PText(text: str1),
      PText(text: str2, color: PColors.primary),
    ],
  );
}
