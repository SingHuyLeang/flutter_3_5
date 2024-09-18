import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_app/controller/pet_controller.dart';
import 'package:pet_app/data/pet.dart';
import 'package:pet_app/utils/theme/text_theme.dart';
import 'package:pet_app/utils/types/colors.dart';

class PetGrid extends StatelessWidget {
  PetGrid({super.key});

  final controller = Get.put(PetController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const PText(text: "Adopt Pet"),
        const SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.pets.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            mainAxisExtent: 250,
          ),
          itemBuilder: (context, index) => productCard(controller.pets[index]),
        )
      ],
    );
  }

  Widget productCard(Pet pet) {
    return Container(
      color: PColors.primary,
    );
  }
}
