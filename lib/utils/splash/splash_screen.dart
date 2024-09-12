import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet_app/featured/authentication/views/login_page.dart';

class SplashController extends GetxController {
  Future delayed() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  void onInit() async {
    super.onInit();
    delayed().whenComplete(() => Get.to(() => LogInPage()));
  }
}

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final splash = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SvgPicture.asset(
            "assets/images/playful_cat.svg",
            width: 364,
            height: 181,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
