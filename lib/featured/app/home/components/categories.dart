import 'package:flutter/material.dart';
import 'package:pet_app/utils/theme/text_theme.dart';
import 'package:pet_app/utils/types/colors.dart';

class CategoriesSlider extends StatelessWidget {
  CategoriesSlider({super.key});

  final categories = [
    "All",
    "Cats",
    "Dogs",
    "Fish",
    "Birds",
    "Mammals",
    "Cows",
    "Pig",
    "Hamster",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // title
          const Padding(
            padding: EdgeInsets.only(left: 32.0),
            child: PText(
              text: "Categories",
              weight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          // slider category
          SizedBox(
            width: double.infinity,
            height: 40,
            child: ListView.builder(
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                margin: EdgeInsets.only(left: index == 0 ? 32 : 8, right: 8),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: index == 0 ? PColors.primary : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: index == 0 ? PColors.primary : PColors.solid,
                  ),
                ),
                child: PText(
                  text: categories[index],
                  color: index == 0 ? PColors.light : PColors.dark,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
