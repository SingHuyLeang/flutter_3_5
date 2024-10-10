import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pet_app/components/asset_button.dart';
import 'package:pet_app/featured/app/model/pet.dart';
import 'package:pet_app/utils/types/colors.dart';

class DetialHeading extends StatelessWidget {
  const DetialHeading({super.key, required this.pet});
  final Pet pet;
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: pet.id,
      child: Container(
        width: double.infinity,
        height: 400,
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(pet.image),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AssetButton(
                width: 34,
                height: 34,
                radius: 100,
                padding: 4,
                onTab: () => Get.back(),
                color: PColors.dark.withOpacity(0.7),
                icon: "assets/images/arrow-back.svg",
              ),
              GestureDetector(
                child: Container(
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 0),
                        blurRadius: 10,
                        spreadRadius: 4,
                        color: Color(0x83FFFFFF),
                      )
                    ],
                  ),
                  child: SvgPicture.asset(
                    'assets/images/bookmark.svg',
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                    width: 16,
                    height: 20,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
