import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet_app/featured/app/view/cart/cart_page.dart';
import 'package:pet_app/featured/app/view/home/components/categories.dart';
import 'package:pet_app/featured/app/view/home/components/home_header.dart';
import 'package:pet_app/featured/app/view/home/components/pet_grid.dart';
import 'package:pet_app/utils/theme/text_theme.dart';
import 'package:pet_app/utils/types/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              // Logo & Welcome
              const HomeHeader(),
              const SizedBox(height: 37),
              // tamnail
              Image.asset('assets/images/tamnail.png'),
              const SizedBox(height: 32),
              // categories
              CategoriesSlider(),
              const SizedBox(height: 32),
              // pet list
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                alignment: Alignment.centerLeft,
                child: PetGrid(),
              ),
              // footer
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: PText(
                  text: 'Pet App. All rights reserved.',
                  color: PColors.stroke,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: PColors.primary,
        onPressed: () => Get.to(() => CartPage()),
        child: SvgPicture.asset('assets/images/cart.svg'),
      ),
    );
  }
}
