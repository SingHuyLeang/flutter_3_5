import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_app/featured/app/home/components/categories.dart';
import 'package:pet_app/featured/app/home/components/home_header.dart';
import 'package:pet_app/featured/app/home/components/pet_grid.dart';
import 'package:pet_app/utils/theme/text_theme.dart';
import 'package:pet_app/utils/types/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final scrollPhysic = const ScrollPhysics();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: scrollPhysic,
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
                child: PetGrid(scrollPhysics: scrollPhysic),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
