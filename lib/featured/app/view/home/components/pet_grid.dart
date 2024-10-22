import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet_app/featured/app/controller/pet_controller.dart';
import 'package:pet_app/featured/app/model/pet.dart';
import 'package:pet_app/featured/app/view/detail/datail_page.dart';
import 'package:pet_app/utils/coverts/converter.dart';
import 'package:pet_app/utils/theme/text_theme.dart';

class PetGrid extends StatelessWidget {
  PetGrid({super.key});

  final controller = Get.put(PetController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const PText(text: "Adopt Pet", size: 16),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.pets.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              mainAxisExtent: 253,
            ),
            itemBuilder: (context, index) =>
                productCard(controller.pets[index]),
          )
        ],
      ),
    );
  }

  Widget productCard(Pet pet) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // image
        GestureDetector(
          onTap: () => Get.to(DetailPage(pet: pet)),
          child: Hero(
            tag: pet.name,
            child: Container(
              width: double.infinity,
              height: 187,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: pet.image.isNotEmpty
                    ? DecorationImage(
                        fit: BoxFit.cover,
                        image: Converter().convertStringToFileImage(pet.image),
                      )
                    : null,
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        // name & save
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // name
            PText(
              text: pet.name,
              line: 1,
              overflow: TextOverflow.ellipsis,
            ),
            // save button
            GestureDetector(
              child: SvgPicture.asset(
                'assets/images/bookmark.svg',
                fit: BoxFit.cover,
                alignment: Alignment.center,
                width: 16,
                height: 20,
              ),
            )
          ],
        ),
        const SizedBox(height: 12),
        // price
        PText(text: '\$ ${pet.price}'),
      ],
    );
  }
}
