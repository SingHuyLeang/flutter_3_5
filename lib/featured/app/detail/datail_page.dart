import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pet_app/components/asset_button.dart';
import 'package:pet_app/data/pet.dart';
import 'package:pet_app/utils/types/colors.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.pet});
  final Pet pet;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            // hero image
            Hero(
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
                                color: Colors.white,
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
            ),
            // details
            Padding(
              padding: const EdgeInsets.only(top: 380),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.green[100],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
