import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_app/utils/theme/text_theme.dart';
import 'package:pet_app/utils/types/colors.dart';
import 'package:pet_app/utils/types/fonts.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 32),
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Row(
        children: [
          // logo
          Hero(
            tag: 11111111,
            child: SvgPicture.asset(
              'assets/images/logo.svg',
              width: 34,
              height: 34,
            ),
          ),
          const SizedBox(width: 16),
          // welcome
          const PText(text: "Welcome, ", fontType: Font.bold, size: 24),
          PText(
            text: "Humans ",
            fontType: Font.bold,
            size: 24,
            color: PColors.primary,
          ),
          const PText(text: "!", fontType: Font.bold, size: 24),
        ],
      ),
    );
  }
}
